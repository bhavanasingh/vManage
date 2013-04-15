package inventory;
import java.sql.*;
import java.util.*;


/* Class for generating list of expiring goods in next 1 month. Return type of getExpiredItems is List<String> and input Parameters(Connection to the database)
*/

public class ExpiredList implements ExpiredOutofStock{

public List<String> expired;

  public List<String> getExpiredItems(Connection Con)
	{

		try{
		expired=new ArrayList<String>();
		
		Statement stmt=Con.createStatement();		
		String query="select Item_name,Item_id from Item where TO_DAYS(ExpDate)-TO_DAYS(CURDATE())<=30;";
		
		ResultSet rs=stmt.executeQuery(query);
				
		while(rs.next())
		{
			
			String st="The Item Name:"+rs.getString("Item_name")+" "+"having item id:"+rs.getString("Item_id")+"is about to expire in the next 30 days . Take the needed action"+"\n";			
			expired.add(st);
		}
			
		
		


		
	
		
	//return expired;

		}
		catch(SQLException e)
		{
		}	
	return expired;	
	}
	
	
	public List<String> getOutofStockItems(Connection con)
	{
		return expired;
	}



}
