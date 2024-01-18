package com.itwill.shop.plan;

public class PlanSQL {
	
	final static public String INSERT_PLAN="insert into plan values(plan_plan_no_seq.nextval,#{planName},#{planDc},#{planFare},#{planDesc})";
	
	final static public String SELECT_ALL_PLAN="select * from plan order by plan_fare desc";
	final static public String SELECT_PLAN_BY_PLAN_NO="select * from plan where plan_no=#{planNo}";
	final static public String SELECT_PLAN_BY_PLAN_NAME="select * from plan where plan_name=#{planName} order by plan_fare desc";
	final static public String SELECT_PLAN_BY_PLAN_FARE_RANGE="select * from plan where plan_fare>=#{minFare} and plan_fare<=#{maxFare} order by plan_fare desc";
	final static public String SELECT_PLAN_BY_PLAN_DESC_KEYWORD="select * from plan where plan_desc like '%'||#{planDesc}||'%' order by plan_fare desc";
	final static public String SELECT_PLAN_BY_PLAN_DC_RANGE="select * from plan where plan_dc>=#{maxDc} and plan_dc<=#{minDc} order by plan_fare desc";
	final static public String SELECT_PLAN_BY_PLAN_FARE_DC_RANGE="select * from plan where plan_fare>=#{minFare} and plan_fare<=#{maxFare} and plan_dc>=#{minDc} and plan_dc<=#{maxDc} order by plan_fare desc";

	final static public String UPDATE_PLAN="update plan set plan_name=#{planName}, plan_dc= #{planDc}, plan_fare= #{planFare}, plan_desc=#{planDesc} where plan_no=#{planNo}";

	final static public String DELETE_PLAN="delete plan where plan_no=#{planNo}";

}
