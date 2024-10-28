<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Job Filter</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .filter-section {
            margin-bottom: 20px;
        }
        .filter-section h3 {
            margin-bottom: 10px;
            font-size: 1.2em;
        }
        .checkbox-group {
            display: none; /* 기본적으로 숨김 */
            flex-wrap: wrap;
        }
        .checkbox-group label {
            margin-right: 20px;
            margin-bottom: 10px;
        }
        .checkbox-group input {
            margin-right: 5px;
        }
        .category-bar {
            cursor: pointer;
            padding: 10px;
            background-color: #EBFFEE;
            border-radius: 4px;
            margin-bottom: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border: 1px solid;
            font-weight: bold;
        }
        .category-bar:hover {
            background-color: #ddd;
        }
        .button-group {
            text-align: center;
            margin-top: 20px;
        }
        .button-group button {
            padding: 10px 20px;
            font-size: 1em;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .button-group button:hover {
            background-color: #45a049;
        }
     .search-bar {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

.search-bar input[type="text"] {
    width: 70%;
    padding: 10px;
    font-size: 1em;
    border: 1px solid #ccc;
    border-radius: 4px 0 0 4px; /* 왼쪽 모서리만 둥글게 */
}

.search-bar .search-button {
    padding: 10px 20px;
    font-size: 1em;
    background-color: #4CAF50;
    color: white;
    border: none;
    border-radius: 0 4px 4px 0; /* 오른쪽 모서리만 둥글게 */
    cursor: pointer;
    transition: background-color 0.3s ease; /* 버튼의 색상이 변하는 애니메이션 */
}

.search-bar .search-button:hover {
    background-color: #45a049;
}

   /* 검색 결과 카드 스타일 */
        .job-card {
            background-color: #EBFFEE;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-left: 5px solid #4CAF50;
            display: flex;
            flex-direction: column;
        }

        .job-title {
            font-size: 1.2em;
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
        }

        .job-location {
            font-size: 1em;
            color: #666;
            margin-bottom: 8px;
        }

        .job-skills {
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
        }

        .job-skill {
            background-color: #4CAF50;
            color: white;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9em;
        }
        
      /* 페이징 스타일 */
    .pagination {
        text-align: center;
        margin-top: 20px;
    }

    .pagination a, .pagination .page-number {
        margin: 0 5px;
        padding: 8px 12px;
        color: #4CAF50;
        text-decoration: none;
        border: 1px solid #ddd;
        border-radius: 4px;
        transition: background-color 0.3s;
        display: inline-block;
    }

    .pagination a:hover {
        background-color: #ddd;
    }

  .current-page {
    background-color: #EBFFEE; /* 강조 색상 */
    color: #2E7D32; /* 진한 글자 색상 (어두운 초록색) */
    font-weight: bold; /* 글자 두껍게 */
    border: 1px solid #2E7D32; /* 경계 색상과 일치 */
}
    </style>
</head>
<body>

    <div class="container">
        <h2>Job Filter</h2>

        <!-- 검색란 섹션 -->
        <form action="/Common/RecruitSearch" method="get">
            <div class="search-bar">
                <input type="text" id="searchKeyword" name="recruit_title" placeholder="채용공고검색" value="${ recruit_title eq null || recruit_title eq ''  ? '' : recruit_title }">
            	<input type="submit" class="search-button" value="Search">
            </div>
	
            <!-- 기술 선택 섹션 -->
            <div class="filter-section">
                <h3>Select Skills</h3>
	
                <div class="category-bar" onclick="toggleSection('backendSkills', this)">
                    <span>백엔드</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="backendSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '백엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                                     <c:forEach var="skillListCheck" items="${ skillListCheck }">
                                    <c:if test="${ skillListCheck.skill_name eq skillList.skill_name }">checked</c:if>
                                	</c:forEach> />
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
	
                <div class="category-bar" onclick="toggleSection('frontendSkills', this)">
                    <span>프론트엔드</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="frontendSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '프론트엔드'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                                     <c:forEach var="skillListCheck" items="${ skillListCheck }">
                                    <c:if test="${ skillListCheck.skill_name eq skillList.skill_name }">checked</c:if>
                                	</c:forEach> />
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
	
                <div class="category-bar" onclick="toggleSection('dbSkills', this)">
                    <span>데이터베이스</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="dbSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '데이터베이스'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                                     <c:forEach var="skillListCheck" items="${ skillListCheck }">
                                    <c:if test="${ skillListCheck.skill_name eq skillList.skill_name }">checked</c:if>
                                	</c:forEach> />
                                	<label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
	
                <div class="category-bar" onclick="toggleSection('mobileSkills', this)">
                    <span>모바일</span>
                    <span class="toggle-icon">▼</span>
                </div>
                <div id="mobileSkills" class="checkbox-group">
                    <c:forEach var="skillList" items="${ skillList }">
                        <c:if test="${ skillList.skill_stack eq '모바일'}">
                            <div>
                                <input type="checkbox" id="skill_name_${skillList.skill_name}" name="skill_name" value="${ skillList.skill_name }"
                                    <c:forEach var="skillListCheck" items="${ skillListCheck }">
                                    <c:if test="${ skillListCheck.skill_name eq skillList.skill_name }">checked</c:if>
                                	</c:forEach> />
                                <label for="skill_name_${skillList.skill_name}">${ skillList.skill_name }</label>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
               <!-- 지역 선택 섹션 -->
	        <div class="filter-section">
	            <h3>Select Regions</h3>
	            <div class="category-bar" onclick="toggleSection('regions', this)">
	                <span>지역 선택</span>
	                <span class="toggle-icon">▼</span>
	            </div>
	            <div id="regions" class="checkbox-group">
	              <c:forEach var="region" items="${regionList}">
				    <input type="checkbox" id="region_${region.region_idx}" name="region_idx" value="${region.region_idx}"
				        <c:forEach var="regionListCheck" items="${regionListCheck}">
				            <c:if test="${regionListCheck.region_idx == region.region_idx}">checked</c:if>
				        </c:forEach> />
				    <label for="region_${region.region_idx}">${region.region_name}</label>
				</c:forEach>
	            </div>
	        </div>
	
        </form>
        
           <!-- 검색 결과 리스트 섹션 -->
        <c:if test="${ companyRecruitList ne null  }">
        <div id="job-results">
            <h3>Search Results</h3>
            <c:forEach var="companyRecruit" items="${companyRecruitList}">
                <div class="job-card">
                    <div class="job-title">제목 : ${ companyRecruit.RECRUIT_TITLE }</div>
                    <div class="job-title">회사이름 : ${ companyRecruit.COMPANY_NAME }</div>
                    <div class="job-location">지역: ${ companyRecruit.REGION_NAME }</div>
                    <div class="job-skills">
                        <c:forEach var="skill_name" items="${ companyRecruit.SKILL_NAME }">
                            <span class="job-skill">${skill_name}</span>
                        </c:forEach>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- 페이징 영역 -->
			<div class="pagination">
        	<c:if test="${ nowpage > 1 }">
        		<c:set var="url" value="?nowpage=${nowpage - 1}&pageSize=${pageSize}&recruit_title=${recruit_title}" />
        		  <!-- skill_name 쿼리 파라미터 추가 -->
			    <c:forEach var="skill" items="${skillListCheck}">
			        <c:set var="url" value="${url}&skill_name=${skill.skill_name}" />
			    </c:forEach>
			
			    <!-- region_idx 쿼리 파라미터 추가 -->
			    <c:forEach var="region" items="${regionListCheck}">
			        <c:set var="url" value="${url}&region_idx=${region.region_idx}" />
			    </c:forEach>
			    
        		<a href="${ url }">이전</a>
        	</c:if>
        	
        	<c:forEach var="i" begin="1" end="${pagination.totalPageCount}">
			    <c:set var="url" value="?nowpage=${i}&pageSize=${pageSize}&recruit_title=${recruit_title}" />
			
			    <!-- skill_name 쿼리 파라미터 추가 -->
			    <c:forEach var="skill" items="${skillListCheck}">
			        <c:set var="url" value="${url}&skill_name=${skill.skill_name}" />
			    </c:forEach>
			
			    <!-- region_idx 쿼리 파라미터 추가 -->
			    <c:forEach var="region" items="${regionListCheck}">
			        <c:set var="url" value="${url}&region_idx=${region.region_idx}" />
			    </c:forEach>
			
			    <!-- 링크에 완성된 URL 적용 -->
			    <a class="${i == nowpage ? 'current-page' : ''}" href="${url}">${i}</a>
			</c:forEach>
            
        	<c:if test="${ nowpage < pagination.endPage }">
        		<c:set var="url" value="?nowpage=${nowpage + 1}&pageSize=${pageSize}&recruit_title=${recruit_title}" />
        		  <!-- skill_name 쿼리 파라미터 추가 -->
			    <c:forEach var="skill" items="${skillListCheck}">
			        <c:set var="url" value="${url}&skill_name=${skill.skill_name}" />
			    </c:forEach>
			
			    <!-- region_idx 쿼리 파라미터 추가 -->
			    <c:forEach var="region" items="${regionListCheck}">
			        <c:set var="url" value="${url}&region_idx=${region.region_idx}" />
			    </c:forEach>
			    
        		<a href="${ url }">다음</a>
        	</c:if>
        </div>
        
        </c:if>
        
        
    </div>

    <script type="text/javascript">
	   
    function toggleSection(sectionId, element, forceOpen = false) {
        var section = document.getElementById(sectionId);
        var icon = element.querySelector(".toggle-icon");
        //alert(section.value);
        
        // 강제 활성화 기능 추가
        if (forceOpen) {
            section.style.display = "flex";
            icon.textContent = "▲";
            return;
        }

        if (section.style.display === "none" || section.style.display === "") {
            section.style.display = "flex";  // 섹션을 보여줍니다.
            icon.textContent = "▲";         // 펼쳐진 상태로 아이콘 변경.
        } else {
            section.style.display = "none";  // 섹션을 숨깁니다.
            icon.textContent = "▼";         // 닫힌 상태로 아이콘 변경.
        }
    }

    document.addEventListener("DOMContentLoaded", function() {
        var skillSections = ["backendSkills", "frontendSkills", "dbSkills", "mobileSkills"];

        skillSections.forEach(function(sectionId) {
            var checkboxes = document.querySelectorAll(`#${sectionId} input[type="checkbox"]`);
            var sectionVisible = false;
			alert( checkboxes.value );
            for (var checkbox of checkboxes) {
                if (checkbox.checked) {
                    sectionVisible = true;
                    break;
                }
            }

            // 체크된 항목이 있다면 toggleSection 함수를 사용하여 강제로 펼쳐줌
            if (sectionVisible) {
                var categoryBar = document.querySelector(`.category-bar[onclick*="${sectionId}"]`);
                if (categoryBar) {
                    toggleSection(sectionId, categoryBar, true); // 강제 활성화
                }
            }
        });

        var regionCheckboxes = document.querySelectorAll("#regions input[type='checkbox']");
        var regionVisible = false;

        for (var checkbox of regionCheckboxes) {
            if (checkbox.checked) {
                regionVisible = true;
                break;
            }
        }

        if (regionVisible) {
            var regionCategoryBar = document.querySelector(`.category-bar[onclick*="regions"]`);
            if (regionCategoryBar) {
                toggleSection('regions', regionCategoryBar, true); // 강제 활성화
            }
        }
    });
    </script>

</body>
</html>