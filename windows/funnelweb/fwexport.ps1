#
# Quick and dirty powershell script to extract blog posts from FunnelWeb Blog to Octopress formatted markdown files.
# Ben Simmonds 2013-07-30
#


$SQLServer = "." #use Server\Instance for named SQL instances! 
$SQLDBName = "funnelweb"
$SqlQuery = "SELECT [Title],[Summary],convert(varchar, [Published], 120),[TagsCommaSeparated],[MetaDescription],[MetaTitle],[Body],convert(char(10), [Published], 120) as JustDate, [Name] FROM [funnelweb].[dbo].[Entry]"

$SqlConnection = New-Object System.Data.SqlClient.SqlConnection
$SqlConnection.ConnectionString = "Server = $SQLServer; Database = $SQLDBName; Integrated Security = True"

$SqlCmd = New-Object System.Data.SqlClient.SqlCommand
$SqlCmd.CommandText = $SqlQuery
$SqlCmd.Connection = $SqlConnection

$SqlAdapter = New-Object System.Data.SqlClient.SqlDataAdapter
$SqlAdapter.SelectCommand = $SqlCmd

$DataSet = New-Object System.Data.DataSet
$SqlAdapter.Fill($DataSet)

$SqlConnection.Close()

$DataSet.Tables[0].Rows | foreach {
 	 Write "---" `
		"`nlayout: post" `
		"`ntitle: ""$($_[0])""" `
		"`ndate: ""$($_[2])""" `
		"`ncomments: false" `
		"`ncategories: ""$($_[3])""" `
		"`n---" `
		"`n" `
		"`n$($_[1])" `
		"`n" `
		"`n$($_[6])" | Out-File "F:\Blog\posts\$($_[7])-$($_[8]).md"
  
  #$post 
  
}
