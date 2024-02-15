# Import the SqlServer module
Import-Module -Name "C:\PWC\SqlServer\22.2.0\SqlNotebook.psm1"

# Set the variables
$serverName = "SUBHANKAR"  # Change this to your SQL Server's external IP address or domain name
$databaseName = "Test"
$username = "testuser"  # Change this to your SQL Server username
$password = "Frog@1234"  # Change this to your SQL Server password
$folderPath = "C:\PWC\StoredProc"  # Change this to your folder path

# Get the list of SQL files in the folder
$sqlFiles = Get-ChildItem -Path $folderPath -Filter "*.sql"

# Iterate through each SQL file
foreach ($file in $sqlFiles) {
    # Read the content of the SQL file
    $sqlQuery = Get-Content -Path $file.FullName -Raw

    # Create a connection to the SQL Server
    $connectionString = "Server=$serverName;Database=$databaseName;User ID=$username;Password=$password;"
    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $connectionString

    # Open the connection
    $connection.Open()

    # Create a command object
    $command = $connection.CreateCommand()

    # Set the command text to the SQL query
    $command.CommandText = $sqlQuery

    # Execute the query
    $command.ExecuteNonQuery()

    # Close the connection
    $connection.Close()

    Write-Host "Stored procedure $($file.Name) executed successfully."
}
