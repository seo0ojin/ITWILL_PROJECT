package com.itwill.shop.plan;

import java.util.List;

public interface PlanDao {

	int insertPlan(Plan plan);

	List<Plan> findAllPlan();

	Plan findPlanByNo(int planNo);

	Plan findPlanByName(String planName);

	List<Plan> findPlanByFareRange(int minFare, int maxFare);

	List<Plan> findPlanByDescKeyword(String planDesc);

	List<Plan> findPlanByDcRange(double minDc, double maxDc);

	List<Plan> findPlanByFareDcRange(int minFare, int maxFare, double minDc, double maxDc);

	int updatePlan(Plan plan);

	int deletePlan(int planNo);

}