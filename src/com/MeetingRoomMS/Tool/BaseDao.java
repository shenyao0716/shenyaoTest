package com.MeetingRoomMS.Tool;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

public class BaseDao {

	  //查询所有  
    public ArrayList getList(Class cl){  
        ArrayList list = new ArrayList();  
        Connection conn = DBConn.getCon();  
        PreparedStatement ps = null;  
        ResultSet rs = null;  
        //由于数据库中的表名对应的是实体类的类名，所以可以通过传入的类得到表名cl.getSimpleName()  
        String sql = "select * from " + cl.getSimpleName();  
        //获取类对象的所有属性  
        Field[] fi = cl.getDeclaredFields();  
        try {  
            ps = conn.prepareStatement(sql);  
            rs = ps.executeQuery();  
            while(rs.next()){  
                Object object = cl.newInstance();//实例化类对象  
                for(Field ff:fi){  
                    ff.setAccessible(true);//打开控制访问权限  
                    ff.set(object, rs.getObject(ff.getName()));  
                }  
                list.add(object);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            DBConn.closeDB(conn, ps, rs);  
        }  
        return list;  
    }  

    
  //根据表的主键查询表的对象  
    public Object getObjectById(Class cl,int id){  
        Connection conn = DBConn.getCon();  
        PreparedStatement ps = null;  
        ResultSet rs = null;  
        Field[] fi = cl.getDeclaredFields();  
        //由于类中不一定用id表示编号，但是通常类中的第一个属性为编号id  
        String sql = "select * from " + cl.getSimpleName() + " where " + fi[0].getName() + " = " + id;  
        Object object = null;  
        try {  
            ps = conn.prepareStatement(sql);  
            rs = ps.executeQuery();  
            while(rs.next()){  
                object = cl.newInstance();  
                for(Field ff:fi){  
                    ff.setAccessible(true);  
                    ff.set(object, rs.getObject(ff.getName()));  
                }  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            DBConn.closeDB(conn, ps, rs);  
        }  
        return object;  
    }  
    
    
    //根据特定条件查询  
    public ArrayList getListByCondition(Class cl,String name,Object value){  
        ArrayList list = new ArrayList();  
        Connection conn = DBConn.getCon();  
        PreparedStatement ps = null;  
        ResultSet rs = null;  
          
        String sql = "select * from " + cl.getSimpleName() + " where " + name + " = '" + value+"'";  
        Field[] fi = cl.getDeclaredFields();  
        try {  
            ps = conn.prepareStatement(sql);  
            rs = ps.executeQuery();  
            while(rs.next()){  
                Object object = cl.newInstance();//实例化类对象  
                for(Field ff:fi){  
                    ff.setAccessible(true);//打开控制访问权限  
                    ff.set(object, rs.getObject(ff.getName()));  
                }  
                list.add(object);  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            DBConn.closeDB(conn, ps, rs);  
        }  
        return list;  
    }  
    
    
  //插入对象  
//    public boolean insert(Object object){  
//
//        boolean flag = false;  
//  
//        Connection conn = DBConn.getCon();  
//        PreparedStatement ps = null;  
//        //获取对象的类  
//        Class cl = object.getClass();  
//        Field[] fi = cl.getDeclaredFields();  
//                //insert into Person(name) values(?,?,?)  
//                //以下开始拼接sql语句  
//                //两个String对象的连接是很耗费资源的，以下方法可以通过StringBuffer优化，  
//                //可以减少资源利用，使用apand对StringBuffer进行拼接  
//        String sql = "insert into " + cl.getSimpleName() + " (";  
//        for (int i = 1; i < fi.length; i++) {  
//            sql = sql + fi[i].getName();  
//            if (i < fi.length-1) {  
//                sql = sql + ",";  
//            }  
//        }  
//        sql = sql + ") values(";  
//        for (int i = 1; i < fi.length; i++) {  
//            sql = sql + "?";  
//            if (i < fi.length-1) {  
//                sql = sql + ",";  
//            }  
//        }  
//        sql = sql + ")";  
//          
//        try {  
//            ps = conn.prepareStatement(sql);  
//            for(int i = 1;i<fi.length;i++){  
//                fi[i].setAccessible(true);  
//                ps.setObject(i, fi[i].get(object));  
//            }  
//            int a = ps.executeUpdate();  
//            if(a > 0){  
//                flag = true;  
//            }  
//        } catch (Exception e) {  
//            e.printStackTrace();  
//        }finally{  
//            DBConn.closeDB(conn, ps); 
//        }  
//        return flag;  
//  
//    }  
    
    //优化插入  
    public boolean insert1(Object object){  
        boolean flag = false;  
        Connection conn = DBConn.getCon();  
        PreparedStatement ps = null;  
        Class cl = object.getClass();  
        Field[] fi = cl.getDeclaredFields();  
        StringBuffer sb = new StringBuffer();  
        sb.append("insert into ");  
        sb.append(cl.getSimpleName());  
        sb.append(" (");  
        for(int i = 1;i<fi.length;i++){  
            sb.append(fi[i].getName());  
            if(i!=fi.length-1){  
                sb.append(" , ");  
            }  
        }  
        sb.append(") values (");  
        for(int i = 1;i<fi.length;i++){  
            sb.append(" ? ");  
            if(i!=fi.length-1){  
                sb.append(" , ");  
            }  
        }  
        sb.append(" ) ");  
        try {  
            ps = conn.prepareStatement(sb.toString());  
            for(int i = 1;i<fi.length;i++){  
                fi[i].setAccessible(true);  
                ps.setObject(i, fi[i].get(object));  
            }  
            int a = ps.executeUpdate();  
            if(a>0){  
                flag = true;  
            }  
              
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
        	 DBConn.closeDB(conn, ps);  
        }  
        return flag;  
    }  
      
    //更新  
    public boolean update(Object object){  
        boolean flag = false;  
        Connection conn =  DBConn.getCon();  
        PreparedStatement ps = null;  
        Class cl = object.getClass();  
        Field[] fi = cl.getDeclaredFields();  
        StringBuffer sb = new StringBuffer();  
            //update person set name = ?,age = ?,type = ? where id = ?  
        sb.append(" update ");  
        sb.append(cl.getSimpleName());  
        sb.append(" set ");  
        for(int i = 1;i<fi.length;i++){  
            fi[i].setAccessible(true);  
            sb.append(fi[i].getName());  
            sb.append(" = ? ");  
            if(i!=fi.length-1){  
                sb.append(" , ");  
            }  
        }  
        sb.append(" where ");  
        sb.append(fi[0].getName());  
        sb.append("=?");  
          
        try {  
            ps = conn.prepareStatement(sb.toString());  
            for(int i = 1;i<fi.length;i++){  
                fi[i].setAccessible(true);  
                ps.setObject(i, fi[i].get(object));  
            }  
            fi[0].setAccessible(true);  
            ps.setObject(fi.length, fi[0].get(object));  
            int a = ps.executeUpdate();  
            if(a>0){  
                flag = true;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
        	 DBConn.closeDB(conn, ps);  
        }  
        return flag;  
    }  
      
    //根据id删除  
    public boolean delete(Class cl , int id){  
        boolean flag = false;  
        Connection conn =  DBConn.getCon();  
        PreparedStatement ps = null;  
        Field[] fi = cl.getDeclaredFields();  
        String sql = "delete from "+cl.getSimpleName()+" where "+fi[0].getName()+" = ?";  
        try {  
            ps = conn.prepareStatement(sql);  
            ps.setObject(1, id);  
            int a = ps.executeUpdate();  
            if(a>0){  
                flag = true;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
        	 DBConn.closeDB(conn, ps);  
        }  
        return flag ;  
      
    }  
      
    //根据特定条件删除  
    public boolean deleteByCondition(Class cl , String name,Object value){  
        boolean flag = false;  
        Connection conn = DBConn.getCon();  
        PreparedStatement ps = null;  
        Field[] fi = cl.getDeclaredFields();  
        String sql = "delete from "+cl.getSimpleName()+" where "+name+" = ?";  
        try {  
            ps = conn.prepareStatement(sql);  
            ps.setObject(1, value);  
            int a = ps.executeUpdate();  
            if(a>0){  
                flag = true;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }finally{  
            DBConn.closeDB(conn, ps);  
        }  
        return flag ;  
    }
    public  static boolean isInTime(String time,String mintime,String maxtime){
		SimpleDateFormat sdf =   new SimpleDateFormat("yyyy-MM-dd");
		try {
			Calendar cjgt=Calendar.getInstance();
			Calendar cleft=Calendar.getInstance();
			Calendar cright=Calendar.getInstance();
			cjgt.setTime(sdf.parse(time));
			cleft.setTime(sdf.parse(mintime));
			cright.setTime(sdf.parse(maxtime));
			
			if((cjgt.compareTo(cleft)>=0)&&(cjgt.compareTo(cright)<=0) ){
				return true;
			}
			
			  return false;
		} catch (ParseException e) {
			// TODO ted catch blockAuto-genera
			e.printStackTrace();
			return false;
		}	
    }
	
	public static String dateToString(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		return format.format(date); 
	}
	
	public static String dateToStringlong(Date date){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return format.format(date); 
	}
}
