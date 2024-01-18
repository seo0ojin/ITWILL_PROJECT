package com.itwill.shop.plan;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class PlanDaoImplMybatis implements PlanDao {
	private SqlSessionFactory sqlSessionFactory;

	public PlanDaoImplMybatis() throws Exception {
		this.sqlSessionFactory = new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}

	@Override
	public int insertPlan(Plan plan) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		int rowCount = planMapper.insertPlan(plan);
		sqlSession.close();
		
		String a = "19970901";
		String year =a.substring(0,4);
		String month =a.substring(0,4);
		String day =a.substring(0,4);
		System.out.println();
		return rowCount;

	}

	@Override
	public List<Plan> findAllPlan() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		List<Plan> planList = planMapper.findAllPlan();
		sqlSession.close();
		return planList;

	}

	@Override
	public Plan findPlanByNo(int planNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		Plan plan = planMapper.findPlanByNo(planNo);
		sqlSession.close();
		return plan;

	}

	@Override
	public Plan findPlanByName(String planName) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		Plan plan = planMapper.findPlanByName(planName);
		sqlSession.close();
		return plan;

	}

	@Override
	public List<Plan> findPlanByFareRange(int minFare, int maxFare) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		List<Plan> planList = planMapper.findPlanByFareRange(minFare, maxFare);
		sqlSession.close();
		return planList;

	}

	@Override
	public List<Plan> findPlanByDescKeyword(String planDesc) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		List<Plan> planList = planMapper.findPlanByDescKeyword(planDesc);
		sqlSession.close();
		return planList;
	}

	@Override
	public List<Plan> findPlanByDcRange(double minDc, double maxDc) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		List<Plan> planList = planMapper.findPlanByDcRange(minDc, maxDc);
		sqlSession.close();
		return planList;

	}

	@Override
	public List<Plan> findPlanByFareDcRange(int minFare, int maxFare, double minDc, double maxDc) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		List<Plan> planList = planMapper.findPlanByFareDcRange(minFare, maxFare, minDc, maxDc);
		sqlSession.close();
		return planList;

	}

	@Override
	public int updatePlan(Plan plan) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		int rowCount = planMapper.updatePlan(plan);
		sqlSession.close();
		return rowCount;

	}

	@Override
	public int deletePlan(int planNo) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		PlanMapper planMapper = sqlSession.getMapper(PlanMapper.class);
		int rowCount = planMapper.deletePlan(planNo);
		sqlSession.close();
		return rowCount;

	}
}
