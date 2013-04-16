//Abhiram Kadiyala

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ItemDB extends DatabaseController {
public ArrayList<String> list = new ArrayList<String>();
  
	public ArrayList<String> readDatabase() throws SQLException{
		
		preparedStatement = connection.prepareStatement("select * from item");
		
		resultSet = preparedStatement.executeQuery();
		return printResult(resultSet);
	}
	private ArrayList<String> printResult(ResultSet rs) throws SQLException{

		System.out.println();
		while (rs.next()) {

		      String name = resultSet.getString("user_name");
		      String email = resultSet.getString("user_email");
		      String password = resultSet.getString("password");

		      System.out.printf("%10s %10s %10s ", name, email, password);
		      System.out.println();
		      list.add(name);
		      list.add(email);
		      list.add(password);
		}
		System.out.println();
		return list;
	}
	public void insertItem(Medicine m){
		
		Statement stmt = null;

		String sql1 = "insert into users values('" +m.getMid() +"','"
					+m.getName() +"','" +m.getBrand() +"','" +m.getCost()+"','" +m.getDescription()+"','" +m.getExpireDate()
					+"','" +m.getStatus()+"','" +m.getStockstatus()+"','" +m.getQuantity()+"','" +m.getAverageConsumption()+"')";
		
		try {
		stmt = connection.createStatement();
			stmt.execute(sql1);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void removeItem(int id) {
		// TODO Auto-generated method stub
		Statement stmt = null;

		String sql1 = "delete from item where Item-ID= '"+id +"'";
		
		try {
		stmt = connection.createStatement();
			stmt.execute(sql1);
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("Medicine(s) with ID "+id +" is(are) removed!");
	}

}
