/*
 * Author: jianqing
 * Date: Nov 4, 2020
 * Description: This document is created for
 */
package com.jianqinggao.surprisebday;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jianqing
 */
public class SecretGarden implements AutoCloseable
        {
    //database
    private String dbName;
    private java.sql.Connection dbConn;
    
    public SecretGarden(String dbName, String host, String dbUsername, String dbPassword, boolean useSSL) throws SQLException, ClassNotFoundException
    {
        this.dbName = dbName;
        this.establishConnection(dbName, host, dbUsername, dbPassword, useSSL);
        //stablishConnection(dbName, dbName, dbUsername, dbPassword, true);); 
    }
    
    public static SecretGarden getDefaultInstance() throws SQLException, ClassNotFoundException
    {
        return new SecretGarden("musicbox", "db.jianqinggao.com:3306", "Main", "45465445_AA", true);
    }
    
    public void establishConnection(String dbName, String host, String dbUsername, String dbPassword, boolean useSSL) throws SQLException, ClassNotFoundException
    {
        //NO this.dbConn = dbConn;
        String connectionURL = "jdbc:mysql://" + host + "/" + dbName;
        this.dbConn = null;
        //Find the driver and make connection;

        Class.forName("com.mysql.cj.jdbc.Driver"); //URL for new version jdbc connector.
        Properties properties = new Properties(); //connection system property
        properties.setProperty("user", dbUsername);
        properties.setProperty("password", dbPassword);
        properties.setProperty("useSSL", Boolean.toString(useSSL));//set this true if domain suppotes SSL
        //"-u root -p mysql1 -useSSL false"
        this.dbConn = DriverManager.getConnection(connectionURL, properties);
    }
    
    
    ///////////////////////////
    /////////////MY MUSICS
    /////////////////////////
    
    public ArrayList<Music> selectFromMusics()throws SQLException
    {
        Statement s = dbConn.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM musics");
        Music m;
        ArrayList<Music> musics = new ArrayList<>();
        while(rs.next())
        {
            m=new Music();
            m.setId(rs.getInt(1));
            m.setName(rs.getString(2));
            m.setArtist(rs.getString(3));
            m.setUrl(rs.getString(4));
            m.setCover(rs.getString(5));
            m.setLrc(rs.getString(6));
            m.setTheme(rs.getString(7));
            musics.add(m);
        }
         
        return musics;
    }
      ///////////////////////////
    /////////////FEEDBACK
    /////////////////////////
    
   public int insertIntoFeedback(int f)throws SQLException
   {
       Statement s = dbConn.createStatement();
       return s.executeUpdate("INSERT INTO webfeedbk VALUES("+f+")");      
   }
     
    ///////////////////////////
    /////////////RECOMMENDATIONS
    /////////////////////////
    
    public int insertIntoRecommendations(String title, String email)throws SQLException
    {
        PreparedStatement ps = dbConn.prepareCall("INSERT INTO recommendation VALUES(?,?)");
        ps.setString(1, title);
        ps.setString(2, email);
        return ps.executeUpdate();
    }
    
    
    public static void main(String[] args)
    {
        try(SecretGarden sg = getDefaultInstance())
        {
            System.out.println(sg.selectFromMusics());
        } catch (SQLException | ClassNotFoundException ex)
        {
            Logger.getLogger(SecretGarden.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    public void close() throws SQLException
    {
        this.dbConn.close();
    }
}
