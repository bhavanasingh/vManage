package inventory;
import java.util.*;
import java.sql.*;
public class receiveitem{

  public List<String> receive;
	public int numberReceived;
	
	public void getList(Connection con)
	{
		
		try{
			receive=new ArrayList<String>();
			Statement stmt=con.createStatement();		
			
			String query="update Item set Quantity = Quantity + "+numberReceived+";";
		
			ResultSet rs=stmt.executeQuery(query);
				
			while(rs.next())
			{
			
				String st=""+numberReceived+" of The Item Name:"+rs.getString("Item_name")+" "+"having item id:"+rs.getString("Item_id")+"have/has been received."+"\n";			
				receive.add(st);
			}
		
		}
		catch(SQLException e)
		{
		}	
	}
	public void readList()
	{
			System.out.println(receive);
	}	
}	
