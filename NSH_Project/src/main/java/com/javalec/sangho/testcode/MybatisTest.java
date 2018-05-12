package com.javalec.sangho.testcode;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
public class MybatisTest {
	@Inject // 컨테이너에서 DataSource빈을 알아서 주입해줍니다. 스프링의 장점
	private SqlSessionFactory sqlfactory; //스프링이 정상적으로 동작할 경우 SqlSessionFactory를 주입시켜줄 것을 요구

	@Test
	public void testFactory() {
		System.out.println(sqlfactory);
	}

	@Test
	public void testSession() {
		try (SqlSession session = sqlfactory.openSession()) { //SqlSession 실제 데이터베이스와의 연결을 담당
			System.out.println("session");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
