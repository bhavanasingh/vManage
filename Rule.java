//package inventory;
import java.util.*;
import java.sql.*;
import de.bezier.data.sql.*;

/* class for adding rules for the medicine stock limits*/
//If Existing rule for a item is there it updates the item rule amount else it adds a new rule.



public class Rule{
  
  protected int Item_id = 0;
  protected int qty = 0;
        public ArrayList<Rule> getRules(MySQL msql){
               ArrayList<Rule> data = new ArrayList<Rule>();
               int i = 0;
          try{
                  
                  Rule rl;
                 msql.connect();
                 String selectQuery = "Select * from Item order by Item_id";
                 msql.query(selectQuery);
                 
                 while (msql.next()){
                    rl = new Rule();
                    rl.Item_id = Integer.parseInt(msql.getString(1));
                    rl.qty = Integer.parseInt(msql.getString(2));
                    data.add(rl);
                    i += 1;
                 }
                 
                 return data;
             }
             catch(Exception e)
            {
              System.out.println(e);
            }
            return data;
        }
        
        Rule (){
          
        }
        
	Rule(int id,int amount, MySQL msql)
	{
		Connection con1 = null;
                
		try{
        		//System.out.println("Connected to the database");
                        //con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?user=root&password=bs140209");
                        msql.connect();
        		System.out.println("Connected to the database");
        		msql.execute("insert into Rule values("+id+","+amount+");");

		}
        	catch(Exception e)
        	{
        		System.out.println(e);
        	}
	}
}
