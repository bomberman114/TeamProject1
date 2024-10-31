package com.green.application.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.green.applicaions.vo.ApplicaionVo;
import com.green.company.recruit.vo.CompanyRecruitVo;
import com.green.user.resume.vo.UserResumeVo;

@Mapper
public interface ApplicationsMapper {

   void setApplicationData(ApplicaionVo applicationVo);

      int countApplication(ApplicaionVo applicationVo);

      void updateApplicationData(ApplicaionVo applicationVo);


      int getApplicationsCount(@Param("company_recruit_idx") int company_recruit_idx,@Param("userResumeIdxList") List<UserResumeVo> userResumeIdxList);

      void setApplicationStatusData(ApplicaionVo applicationVo);

      void deletApplicstionData(int company_recruit_idx);

   void deletApplicstionCompanyRecruitIdx(@Param("comPanyRecruitList") List<CompanyRecruitVo> comPanyRecruitList);


}
