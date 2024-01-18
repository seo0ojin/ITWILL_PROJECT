package com.itwill.shop.plan;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface PlanMapper {
	
	@Insert("insert into plan values(plan_plan_no_seq.nextval,#{planName},#{planDc},#{planFare},#{planDesc})")
	int insertPlan(Plan plan);
	
	@Select("select * from plan order by plan_fare desc")
	List<Plan> findAllPlan();

	@Select("select * from plan where plan_no=#{planNo}")
	Plan findPlanByNo(int planNo);
	
	@Select("select * from plan where plan_name=#{planName}")
	Plan findPlanByName(String planName);

	@Select("select * from plan where plan_fare>=#{minFare} and plan_fare<=#{maxFare} order by plan_fare desc")
	List<Plan> findPlanByFareRange(int minFare, int maxFare);

	@Select("select * from plan where plan_desc like '%'||#{planDesc}||'%' order by plan_fare desc")
	List<Plan> findPlanByDescKeyword(String planDesc);

	@Select("select * from plan where plan_dc>=#{maxDc} and plan_dc<=#{minDc} order by plan_fare desc")
	List<Plan> findPlanByDcRange(double minDc, double maxDc);

	@Select("select * from plan where plan_fare>=#{minFare} and plan_fare<=#{maxFare} and plan_dc>=#{minDc} and plan_dc<=#{maxDc} order by plan_fare desc")
	List<Plan> findPlanByFareDcRange(int minFare, int maxFare, double minDc, double maxDc);

	@Update("update plan set plan_name=#{planName}, plan_dc= #{planDc}, plan_fare= #{planFare}, plan_desc=#{planDesc} where plan_no=#{planNo}")
	int updatePlan(Plan plan);

	@Delete("delete plan where plan_no=#{planNo}")
	int deletePlan(int planNo);

}
