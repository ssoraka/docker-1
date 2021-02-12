package com.example.servingwebcontent;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.List;

@Component
public class DbHandler {

    JdbcTemplate jdbcTemplate;
    static DataSource dataSource = mysqlDataSource();

    public DbHandler() {
        jdbcTemplate = new JdbcTemplate();
        jdbcTemplate.setDataSource(dataSource);

//        jdbcTemplate.execute("create schema public;");
//        jdbcTemplate.execute("DROP TABLE IF EXISTS public.t1;");

        jdbcTemplate.execute("CREATE TABLE IF NOT EXISTS public.persons (" +
                "                    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY," +
                "                    name VARCHAR(100)," +
                "                    surname VARCHAR(100)," +
                "                    position VARCHAR(100) );");
    }

    public void insert(String name, String surname, String position) {
        jdbcTemplate.execute("INSERT INTO public.persons (name,surname,position) VALUES(" +
                "'" + name + "','" + surname + "','" + position + "'" +
                ");");
    }

    public static DataSource mysqlDataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
//        dataSource.setUrl("jdbc:mysql://192.168.99.108:3306/public");
        dataSource.setUrl("jdbc:mysql://db:3306/public");
        dataSource.setUsername("root");
        dataSource.setPassword("root");
        return dataSource;
    }

    public List<Person> select() {
        return jdbcTemplate.query("SELECT * FROM public.persons;", (resultSet, i) -> new Person(
                resultSet.getString("name"),
                resultSet.getString("surname"),
                resultSet.getString("position"))
        );
    }

}
