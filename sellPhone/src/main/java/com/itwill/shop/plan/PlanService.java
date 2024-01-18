package com.itwill.shop.plan;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class PlanService {
	PlanDao planDao;
	public PlanService() throws Exception {
		planDao = new PlanDaoImplMybatis();
	}
	public int insertPlan(Plan plan) {
		return planDao.insertPlan(plan);
	}
	public List<Plan> findAllPlan(){
		return planDao.findAllPlan();
	}
	public Plan findPlanByNo(int planNo) {
		return planDao.findPlanByNo(planNo);
	}
	public Plan findPlanByName(String planName) {
		return planDao.findPlanByName(planName);
	}
	public List<Plan> findPlanByFareRange(int minFare, int maxFare) {
		return planDao.findPlanByFareRange(minFare, maxFare);
	}
	public List<Plan> findPlanByDescKeyword(String planDesc){
		return planDao.findPlanByDescKeyword(planDesc);
	}
	public List<Plan> findPlanByDcRange(double minDc, double maxDc){
		return planDao.findPlanByDcRange(minDc, maxDc);
	}
	public List<Plan> findPlanByFareDcRange(int minFare,int maxFare, double minDc, double maxDc){
		return planDao.findPlanByFareDcRange(minFare, maxFare, minDc, maxDc);
	}
	public int updatePlan(Plan plan) {
		return planDao.updatePlan(plan);
	}
	public int deletePlan(int planNo) {
		return planDao.deletePlan(planNo);
	}
}
