package inventory;
import java.sql.*;
import java.util.*;

/* This is the class corresponding to OutofStock IItems.
The getOutofStockItem returns the List of items that are below a specified rule( refer Rule database for rules)
*/


public class OutofStockList implements ExpiredOutofStock{

public List<String> outofstock;

  public List<String> getExpiredItems(Connection Con)
	{
		return outofstock ;
	}
	public List<String> getOutofStockItems(Connection Con)
	{


		try{
		outofstock=new ArrayList<String>();
		String query="select Item.Item_id,Item_name from Item,Rule where Rule.Consumption_per_month>Item.Quantity and Item.Item_id=Rule.Item_id;";
		Statement stmt=Con.createStatement();
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{
			String st="The Item with ID:"+rs.getString("Item_id")+" is below the average monthly consumption. "+"Consider buying more of the following medicine"+rs.getString("Item_name")+"\n";
			outofstock.add(st);
		}
		//return outofstock;
		}
		catch(SQLException e)
		{
		}
		return outofstock;
		
	}
		
	
}
