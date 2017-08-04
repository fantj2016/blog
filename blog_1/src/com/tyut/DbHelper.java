package com.tyut;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;

public class DbHelper {
	public static QueryRunner getQueryRunner() {
		DataSource ds = null;
		try {
			// 获取数据源对象
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:/comp/env/jdbc/mysqlds");
		} catch (Exception e) {
			e.printStackTrace();
		}
		QueryRunner qr = new QueryRunner(ds);
		return qr;
	}
}
