import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;

// Quick 'n dirty converter from SQL to cypher
public class Main
{
    // Path of output file
    private static final String FILE_PATH = "cypher.txt";

    public static void main(String[] args)
    {
        Connection connnection = Connector.getConnection();

        if(connnection == null)
        {
            // exit
            return;
        }

        String sql = "SELECT * FROM ";
        String cypher_line = "";

        try
        {
            ResultSet resultSet = Connector.getQueryResult(connnection, sql);

            while (resultSet.next())
            {
                // Clear variable
                cypher_line = "";

                // Build a cypher line
                cypher_line += resultSet.getString("");

                /*
                ... to be continued ...
                */


                try(FileWriter fw = new FileWriter(FILE_PATH, true);
                    BufferedWriter bw = new BufferedWriter(fw);
                    PrintWriter printWriter = new PrintWriter(bw))
                {
                    // Append generated Cypher line to File
                    printWriter.println(cypher_line);

                }

                catch (IOException e)
                {
                    e.printStackTrace();
                    return;
                }
            }
        }

        catch (Exception e)
        {
            e.printStackTrace();
            return;
        }

        // Close Connection
        Connector.closeConnection(connnection);

    }

    private void addToCypher(Connection c, String sql)
    {

    }
}
