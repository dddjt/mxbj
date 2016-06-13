<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="com.ddcb.dao.ICourseDao"%>
<%@ page import="com.ddcb.dao.IUserCollectionDao"%>
<%@ page import="com.ddcb.dao.IUserCourseDao"%>
<%@ page import="com.ddcb.model.LiveCourseModel"%>
<%@ page import="com.ddcb.model.UserCollectionModel"%>
<%@ page import="com.ddcb.model.UserCourseModel"%>
<%@ page import="com.ddcb.utils.WeixinTools"%>
<%@ page import="java.util.*"%>
<%
WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(this.getServletContext());
ICourseDao courseDao = (ICourseDao)wac.getBean("courseDao");
IUserCourseDao userCourseDao = (IUserCourseDao)wac.getBean("userCourseDao");
String userId = (String)session.getAttribute("openid");
userId="os3bVs6Qiq2Bo1dbu36Tu9WkDEa8";
List<LiveCourseModel> list = courseDao.getAllLiveCourse(1, 8, userId);
String code = (String)session.getAttribute("url_code");
Map<String, String> result = new HashMap<>();
result = WeixinTools.getSign("http://www.dreamnotechina.com/weixin/weixinLogin?view=ddcb_live_class&code="+code+"&state=123");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<title>梦想笔记</title>
		<link href="/css/weixincss/mui.min.css" rel="stylesheet" />
		<link href="/css/weixincss/mui.picker.min.css" rel="stylesheet" />
		<link href="/css/weixincss/mui.poppicker.css" rel="stylesheet" />
		<link href="/css/weixincss/loading.css" rel="stylesheet" />
		<link rel="stylesheet" href="/css/weixincss/bootstrap.min.css">
		<link rel="stylesheet" href="/css/weixincss/style.css">
		<link rel="stylesheet" href="/css/weixincss/newplay.css">
		<link rel="stylesheet" href="/css/weixincss/android.css">
		<script>
			var hasData = true;
		</script>
		<style>
			@font-face {
			  font-weight: normal;
			  font-style: normal;
			  font-family: "weui";
			  src: url('data:application/octet-stream;base64,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') format('truetype'), url('data:application/octet-stream;base64,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') format('woff'), url('data:application/octet-stream;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxtZXRhZGF0YT5Db3B5cmlnaHQgKEMpIDIwMTUgYnkgb3JpZ2luYWwgYXV0aG9ycyBAIGZvbnRlbGxvLmNvbTwvbWV0YWRhdGE+CjxkZWZzPgo8Zm9udCBpZD0id2V1aSIgaG9yaXotYWR2LXg9IjEwMDAiID4KPGZvbnQtZmFjZSBmb250LWZhbWlseT0id2V1aSIgZm9udC13ZWlnaHQ9IjQwMCIgZm9udC1zdHJldGNoPSJub3JtYWwiIHVuaXRzLXBlci1lbT0iMTAwMCIgYXNjZW50PSI4NTAiIGRlc2NlbnQ9Ii0xNTAiIC8+CjxtaXNzaW5nLWdseXBoIGhvcml6LWFkdi14PSIxMDAwIiAvPgo8Z2x5cGggZ2x5cGgtbmFtZT0iY2lyY2xlIiB1bmljb2RlPSImI3hlYTAxOyIgZD0ibTUwMSA3OTFjLTI0NCAwLTQ0Mi0xOTgtNDQyLTQ0MiAwLTI0MyAxOTgtNDQxIDQ0Mi00NDFzNDQxIDE5NyA0NDEgNDQxYzAgMjQ0LTE5OCA0NDItNDQxIDQ0MnogbTAtODQ5Yy0yMjMgMC00MDQgMTgwLTQwNCA0MDMgMCAyMjMgMTgxIDQwMyA0MDQgNDAzIDIyMiAwIDQwMy0xODAgNDAzLTQwMyAwLTIyMy0xODEtNDAzLTQwMy00MDN6IiBob3Jpei1hZHYteD0iMTAwMCIgLz4KPGdseXBoIGdseXBoLW5hbWU9ImRvd25sb2FkIiB1bmljb2RlPSImI3hlYTAyOyIgZD0ibTQ5NSA3OTdjLTI0MiAwLTQ0Mi0yMDAtNDQyLTQ1MiAwLTI0MiAyMDAtNDQyIDQ0Mi00NDIgMjUyIDAgNDUyIDIwMCA0NTIgNDQyIDAgMjUyLTIwMCA0NTItNDUyIDQ1MnogbTE1Ny01MjhsLTExOC0xNTRjLTE5LTI0LTQ5LTI0LTY4IDBsLTExOCAxNTRjLTE5IDI0LTkgNDQgMjIgNDRoOTN2Mjc5YzAgMTAgOCAxOSAxOCAxOWgzOGMxMCAwIDE4LTkgMTgtMTl2LTI3OWg5M2MzMSAwIDQxLTIwIDIyLTQ0eiIgaG9yaXotYWR2LXg9IjEwMDAiIC8+CjxnbHlwaCBnbHlwaC1uYW1lPSJpbmZvIiB1bmljb2RlPSImI3hlYTAzOyIgZD0ibTQ5NiA3ODljLTIzOCAwLTQzNS0xOTctNDM1LTQ0NSAwLTIzOCAxOTctNDM1IDQzNS00MzUgMjQ4IDAgNDQ1IDE5NyA0NDUgNDM1IDAgMjQ4LTE5NyA0NDUtNDQ1IDQ0NXogbTM2LTY1NmMwLTktOC0xNy0xNy0xN2gtMjhjLTkgMC0xNyA4LTE3IDE3djI4MmMwIDUgNCA5IDkgOWg0NGM1IDAgOS00IDktOXYtMjgyeiBtLTMxIDMzOWMtMjQgMC00NCAyMC00NCA0NHMyMCA0NCA0NCA0NGMyNCAwIDQ0LTE5IDQ0LTQ0cy0yMC00NC00NC00NHoiIGhvcml6LWFkdi14PSIxMDAwIiAvPgo8Z2x5cGggZ2x5cGgtbmFtZT0ic2FmZV9zdWNjZXNzIiB1bmljb2RlPSImI3hlYTA0OyIgZD0ibTUwMCA4MTJjLTE3My0zOS0yOTktODItNDEzLTExOSAwLTEyMCAwLTIxNiAwLTMxNyAwLTI4MyAyMzEtNDM5IDQxMy00ODggMTgyIDQ5IDQxMyAyMDUgNDEzIDQ4OCAwIDEwMSAwIDE5NyAwIDMxNy0xMTQgMzctMjQwIDgwLTQxMyAxMTl6IG0yNTItMzIxbC0zMjItMzE2Yy0yLTItNS0yLTcgMGwtMTQ4IDE1M2MtMiAyLTIgNS0xIDhsMjEgMjdjMSAyIDQgMyA3IDFsMTIxLTkzYzItMSA1LTEgNyAwbDI5NSAyNDZjMiAyIDUgMiA3IDBsMjAtMTljMS0yIDEtNSAwLTd6IiBob3Jpei1hZHYteD0iMTAwMCIgLz4KPGdseXBoIGdseXBoLW5hbWU9InNhZmVfd2FybiIgdW5pY29kZT0iJiN4ZWEwNTsiIGQ9Im01MDEgNzk0Yy0xNjYtMzgtMjg3LTgwLTM5Ny0xMTQgMC0xMTYgMC0yMDggMC0zMDUgMC0yNzIgMjIzLTQyMiAzOTctNDY5IDE3NCA0NyAzOTcgMTk3IDM5NyA0NjkgMCA5NyAwIDE4OSAwIDMwNS0xMTAgMzQtMjMxIDc2LTM5NyAxMTR6IG0tMjMtMjc2aDQ2YzYgMCAxMC00IDktOWwtMTAtMjE2YzAtMy0yLTUtNS01aC0zNGMtMyAwLTUgMi01IDVsLTEwIDIxNmMwIDUgNCA5IDkgOXogbTIzLTMzNmMtMTggMC0zMyAxNS0zMyAzM3MxNSAzMyAzMyAzMyAzMy0xNSAzMy0zMy0xNS0zMy0zMy0zM3oiIGhvcml6LWFkdi14PSIxMDAwIiAvPgo8Z2x5cGggZ2x5cGgtbmFtZT0ic3VjY2VzcyIgdW5pY29kZT0iJiN4ZWEwNjsiIGQ9Im0yODggMzA1Yy03IDgtOCAyMi0yIDMwbDMgNGM3IDkgMTkgMTEgMjggNGw5OC03NWM5LTcgMjMtNyAzMSAwbDI3NiAyMjljOCA3IDIxIDcgMjktMWwtMiAyYzgtOCA4LTIwIDAtMjhsLTMwNC0yOTljLTctOC0yMC03LTI4IDFsLTEyOSAxMzN6IG02NjkgMzljMCAyNTgtMjA1IDQ2My00NjMgNDYzLTI0NiAwLTQ1MS0yMDUtNDUxLTQ2MyAwLTI0NiAyMDUtNDUxIDQ1MS00NTEgMjU4IDAgNDYzIDIwNSA0NjMgNDUxeiIgaG9yaXotYWR2LXg9IjEwMDAiIC8+CjxnbHlwaCBnbHlwaC1uYW1lPSJzdWNjZXNzX2NpcmNsZSIgdW5pY29kZT0iJiN4ZWEwNzsiIGQ9Im01MDEgNzkxYy0yNDQgMC00NDItMTk4LTQ0Mi00NDIgMC0yNDMgMTk4LTQ0MSA0NDItNDQxczQ0MSAxOTcgNDQxIDQ0MWMwIDI0NC0xOTggNDQyLTQ0MSA0NDJ6IG0wLTg0OWMtMjIzIDAtNDA0IDE4MC00MDQgNDAzIDAgMjIzIDE4MSA0MDMgNDA0IDQwMyAyMjIgMCA0MDMtMTgwIDQwMy00MDMgMC0yMjMtMTgxLTQwMy00MDMtNDAzeiBtMjE0IDU1MGwtMjY2LTIyMWMtOC03LTIyLTctMzAtMWwtOTYgNzNjLTggNy0yMCA1LTI2LTNsLTMtNGMtNi05LTUtMjIgMi0zMGwxMjUtMTI4YzctOCAxOS04IDI3LTFsMjkzIDI4OWM3IDcgOCAxOCAxIDI2LTggNy0yMCA3LTI3IDB6IG0yNiAxYzAgMCAxLTEgMS0xIDAgMCAxLTEgMS0xbC0yIDJ6IiBob3Jpei1hZHYteD0iMTAwMCIgLz4KPGdseXBoIGdseXBoLW5hbWU9InN1Y2Nlc3Nfbm9fY2lyY2xlIiB1bmljb2RlPSImI3hlYTA4OyIgZD0ibTYxIDI4NWMtMTQgMTQtMTggNDAtOSA1OGw2IDExYzggMTggMjggMjMgNDQgMTFsMjAzLTE0N2MxNi0xMSA0MS0xMSA1NiAybDU0MSA0NDZjMTUgMTIgMzkgMTEgNTMtM2wtMTMgMTNjMTQtMTQgMTQtMzcgMC01MWwtNTgzLTU5MWMtMTQtMTQtMzYtMTQtNTAtMWwtMjQ4IDI1MnoiIGhvcml6LWFkdi14PSIxMDAwIiAvPgo8Z2x5cGggZ2x5cGgtbmFtZT0id2FpdGluZyIgdW5pY29kZT0iJiN4ZWEwOTsiIGQ9Im00OTQgODAyYy0yNDQgMC00NDYtMjAyLTQ0Ni00NTggMC0yNDQgMjAyLTQ0NiA0NDYtNDQ2IDI1NiAwIDQ1OCAyMDIgNDU4IDQ0NiAwIDI1Ni0yMDIgNDU4LTQ1OCA0NTh6IG0yNTUtNTUxaC0yOTR2MzM0aDQ1di0yODloMjQ5di00NXoiIGhvcml6LWFkdi14PSIxMDAwIiAvPgo8Z2x5cGggZ2x5cGgtbmFtZT0id2FpdGluZ19jaXJjbGUiIHVuaWNvZGU9IiYjeGVhMGE7IiBkPSJtNzQxIDQ5M2MwIDAgMS0xIDEtMSAwIDAgMS0xIDEtMWwtMiAyeiBtLTI0MCAyOThjLTI0NCAwLTQ0Mi0xOTgtNDQyLTQ0MiAwLTI0MyAxOTgtNDQxIDQ0Mi00NDFzNDQxIDE5NyA0NDEgNDQxYzAgMjQ0LTE5OCA0NDItNDQxIDQ0MnogbTAtODQ5Yy0yMjMgMC00MDQgMTgwLTQwNCA0MDMgMCAyMjMgMTgxIDQwMyA0MDQgNDAzIDIyMiAwIDQwMy0xODAgNDAzLTQwMyAwLTIyMy0xODEtNDAzLTQwMy00MDN6IG0tNDYgNTYxaC0zNnYtMjUzaDI1M3YzNmgtMjE3eiIgaG9yaXotYWR2LXg9IjEwMDAiIC8+CjxnbHlwaCBnbHlwaC1uYW1lPSJ3YXJuIiB1bmljb2RlPSImI3hlYTBiOyIgZD0ibTQ5NCA4MTNjLTI1MCAwLTQ1Ny0yMDctNDU3LTQ2OSAwLTI1MCAyMDctNDU3IDQ1Ny00NTcgMjYyIDAgNDY5IDIwNyA0NjkgNDU3IDAgMjYyLTIwNyA0NjktNDY5IDQ2OXogbS0yMS0yMzZoNTRjMTAgMCAxOC04IDE4LTE4bC0xNC0zMDFjMC01LTUtMTAtMTAtMTBoLTQyYy01IDAtOSA1LTEwIDEwbC0xMyAzMDBjLTEgMTAgNyAxOSAxNyAxOXogbTI3LTQ3MmMtMjUgMC00NSAyMC00NSA0NSAwIDI1IDIwIDQ2IDQ1IDQ2IDI1IDAgNDUtMjEgNDUtNDYgMC0yNS0yMC00NS00NS00NXoiIGhvcml6LWFkdi14PSIxMDAwIiAvPgo8Z2x5cGggZ2x5cGgtbmFtZT0iaW5mb19jaXJjbGUiIHVuaWNvZGU9IiYjeGVhMGM7IiBkPSJtNTAwIDUyMmMzMiAwIDU3IDI2IDU3IDU4IDAgMzEtMjUgNTctNTcgNTctMzIgMC01Ny0yNi01Ny01NyAwLTMyIDI1LTU4IDU3LTU4eiBtNTctNTdoLTE0M3YtMjloNTd2LTMxNmgtNTd2LTI4aDIwMXYyOGgtNTh2MzQ1eiBtLTQzIDM0NGMtMjY4IDAtNDczLTIwNS00NzMtNDczIDAtMjQwIDIwNS00NDUgNDczLTQ0NSAyNDAgMCA0NDUgMjA1IDQ0NSA0NDUgMCAyNjgtMjA1IDQ3My00NDUgNDczeiBtLTE0LTg2MWMtMjIyIDAtNDAyIDE4MC00MDIgNDAyIDAgMjIyIDE4MCA0MDIgNDAyIDQwMiAyMjIgMCA0MDItMTgwIDQwMi00MDIgMC0yMjItMTgwLTQwMi00MDItNDAyeiIgaG9yaXotYWR2LXg9IjEwMDAiIC8+CjxnbHlwaCBnbHlwaC1uYW1lPSJjYW5jZWwiIHVuaWNvZGU9IiYjeGVhMGQ7IiBkPSJtNjU0IDUzMmwtMTU0LTE1NC0xNTQgMTU0LTI4LTI4IDE1NC0xNTQtMTU0LTE1NCAyOC0yOCAxNTQgMTU0IDE1NC0xNTQgMjggMjgtMTU0IDE1NCAxNTQgMTU0eiBtLTE1NCAyNTNjLTI0MCAwLTQzNS0xOTUtNDM1LTQzNSAwLTI0MCAxOTUtNDM1IDQzNS00MzUgMjQwIDAgNDM1IDE5NSA0MzUgNDM1IDAgMjQwLTE5NSA0MzUtNDM1IDQzNXogbTAtODMxYy0yMTggMC0zOTUgMTc4LTM5NSAzOTYgMCAyMTggMTc3IDM5NiAzOTUgMzk2IDIxOCAwIDM5Ni0xNzggMzk2LTM5NiAwLTIxOC0xNzgtMzk2LTM5Ni0zOTZ6IiBob3Jpei1hZHYteD0iMTAwMCIgLz4KPGdseXBoIGdseXBoLW5hbWU9InNlYXJjaCIgdW5pY29kZT0iJiN4ZWEwZTsiIGQ9Im02NTMgMTQwYy02OS01Ni0xNTctOTAtMjUzLTkwLTIyMSAwLTQwMCAxNzktNDAwIDQwMHMxNzkgNDAwIDQwMCA0MDAgNDAwLTE3OSA0MDAtNDAwYzAtOTYtMzQtMTg0LTkwLTI1M2wyOTAtMjkxLTU2LTU2LTI5MSAyOTB6IG0tMjUzLTEwYzE3NyAwIDMyMCAxNDMgMzIwIDMyMHMtMTQzIDMyMC0zMjAgMzIwLTMyMC0xNDMtMzIwLTMyMCAxNDMtMzIwIDMyMC0zMjB6IiBob3Jpei1hZHYteD0iMTAwMCIgLz4KPC9mb250Pgo8L2RlZnM+Cjwvc3ZnPg==') format('svg');
			}
			[class^="weui_icon_"]:before,
			[class*=" weui_icon_"]:before {
			  font-family: "weui";
			  font-style: normal;
			  font-weight: normal;
			  speak: none;
			  display: inline-block;
			  vertical-align: middle;
			  text-decoration: inherit;
			  width: 1em;
			  margin-right: .2em;
			  text-align: center;
			  /* opacity: .8; */
			  /* For safety - reset parent styles, that can break glyph codes*/
			  font-variant: normal;
			  text-transform: none;
			  /* fix buttons height, for twitter bootstrap */
			  line-height: 1em;
			  /* Animation center compensation - margins should be symmetric */
			  /* remove if not needed */
			  margin-left: .2em;
			  /* you can be more comfortable with increased icons size */
			  /* font-size: 120%; */
			  /* Uncomment for 3D effect */
			  /* text-shadow: 1px 1px 1px rgba(127, 127, 127, 0.3); */
			}
			.mui-views,
			.mui-view,
			.mui-pages,
			.mui-page,
			.mui-page-content {
				position: absolute;
				left: 0;
				right: 0;
				top: 0;
				bottom: 0;
				width: 100%;
				height: 100%;
				background-color: #efeff4;
			}
			.mui-pages {
				top: 46px;
				height: auto;
			}
			.mui-scroll-wrapper,
			.mui-scroll {
				background-color: #efeff4;
			}
			.mui-page.mui-transitioning {
				-webkit-transition: -webkit-transform 300ms ease;
				transition: transform 300ms ease;
			}
			.mui-page-left {
				-webkit-transform: translate3d(0, 0, 0);
				transform: translate3d(0, 0, 0);
			}
			.mui-ios .mui-page-left {
				-webkit-transform: translate3d(-20%, 0, 0);
				transform: translate3d(-20%, 0, 0);
			}
			.mui-navbar {
				position: fixed;
				right: 0;
				left: 0;
				z-index: 10;
				height: 44px;
				background-color: #f7f7f8;
			}
			.mui-navbar .mui-bar {
				position: absolute;
				background: transparent;
				text-align: center;
			}
			.mui-android .mui-navbar-inner.mui-navbar-left {
				opacity: 0;
			}
			.mui-ios .mui-navbar-left .mui-left,
			.mui-ios .mui-navbar-left .mui-center,
			.mui-ios .mui-navbar-left .mui-right {
				opacity: 0;
			}
			.mui-navbar .mui-btn-nav {
				-webkit-transition: none;
				transition: none;
				-webkit-transition-duration: .0s;
				transition-duration: .0s;
			}
			.mui-navbar .mui-bar .mui-title {
				display: inline-block;
				width: auto;
			}
			.mui-page-shadow {
				position: absolute;
				right: 100%;
				top: 0;
				width: 16px;
				height: 100%;
				z-index: -1;
				content: '';
			}
			.mui-page-shadow {
				background: -webkit-linear-gradient(left, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
				background: linear-gradient(to right, rgba(0, 0, 0, 0) 0, rgba(0, 0, 0, 0) 10%, rgba(0, 0, 0, .01) 50%, rgba(0, 0, 0, .2) 100%);
			}
			.mui-navbar-inner.mui-transitioning,
			.mui-navbar-inner .mui-transitioning {
				-webkit-transition: opacity 300ms ease, -webkit-transform 300ms ease;
				transition: opacity 300ms ease, transform 300ms ease;
			}
			.mui-page {
				display: none;
			}
			.mui-pages .mui-page {
				display: block;
			}
			.mui-page .mui-table-view:first-child {
				margin-top: 0px;
			}
			.mui-page .mui-table-view:last-child {
				margin-bottom: 0px;
			}
			.mui-table-view {
				margin-top: 20px;
			}
			
			.mui-table-view span.mui-pull-right {
				color: #999;
			}
			.mui-table-view-divider {
				background-color: #efeff4;
				font-size: 14px;
			}
			.mui-table-view-divider:before,
			.mui-table-view-divider:after {
				height: 0;
			}
			.head {
				height: 40px;
			}
			#head {
				line-height: 40px;
			}
			.head-img {
				width: 40px;
				height: 40px;
			}
			#head-img1 {
				position: absolute;
				bottom: 10px;
				right: 40px;
				width: 40px;
				height: 40px;
			}
			.update {
				font-style: normal;
				color: #999999;
				margin-right: -25px;
				font-size: 15px
			}
			.mui-fullscreen {
				position: fixed;
				z-index: 20;
				background-color: #000;
			}
			.mui-ios .mui-navbar .mui-bar .mui-title {
				position: static;
			}
		</style>
	</head>
	<body>
		<div id="ddcb_live_class" class="mui-views">
			<div class="mui-view">
				<div class="mui-navbar">
				</div>
				<div class="mui-pages">
				</div>
			</div>
		</div>
		<div id="mainpage" class="mui-page">
    		<div class="mui-navbar-inner mui-bar mui-bar-nav" style="background-color: #66d6a6;">
				<h1 class="mui-center mui-title" style="color:white;">点豆直播课</h1>
				<!-- <a id="searchButton" style="color:white;font-size: 25px;font-weight:600;" class="mui-icon mui-icon-search mui-pull-right"></a> -->
			</div>
			<div id="pullrefresh" class="mui-content mui-scroll-wrapper">
				<div class="mui-scroll">
				<%if(list == null || list.isEmpty()) {%>
				<div style="margin-top:50%;text-align:center;">暂时没有数据，请稍后重试！</div>
				<script>
					hasData = false;
				</script>
				<%} else {%>
				<div style="margin-top:5px;">
					<ul id="data_list" class="mui-table-view">
						<%for(LiveCourseModel cm : list) { %>
						<li class="mui-table-view-cell mui-media" course_id="<%=cm.getId()%>">
							<a href="#courseBrowser">
							<div class="browser_class" course_id="<%=cm.getId()%>">
							<img class="mui-media-object mui-pull-left" style="height:50px;width:80px;max-width:100px;" src="/files/imgs/<%=cm.getImage()%>">
							<div class="mui-media-body">
								<h4 style="font-size:12px;margin-top:0px;margin-bottom:0px;"><%=cm.getName() %></h4>
								<h6 style="color:#2ab888;margin-top:2px;margin-bottom:2px;" class='mui-ellipsis'><span style="font-size:16px;" class="mui-icon mui-icon-contact"></span><%=cm.getTeacher() %></h6>
								<h6 style="color:#888888;margin-top:2px;margin-bottom:2px;" class='mui-ellipsis'><span style="font-size:16px;" class="mui-icon mui-icon-compose"></span>直播时间<%=cm.getCourse_date_readable() %></h6>
							</div>
							</div>
							</a>
							<div style="margin-top:5px;">
								<div style="float:left;height:25px;line-height:25px;"><p style="font-size:12px;">课程售价：<%=cm.getPrice() %>元</p></div>
								<%if(cm.getPay_status() != null && cm.getPay_status() == 1) { %>
									<div style="float:right;"><button onclick="enterClass(null, this)" course_id="<%=cm.getId()%>" style="height:25px;line-height:25px;padding:0px 5px;font-size:12px;">点击进入</button></div>
								<%} else {%>
									<div style="float:right;"><button class="buy_class" course_price="<%=cm.getPrice() %>" course_id="<%=cm.getId()%>" style="height:25px;line-height:25px;padding:0px 5px;font-size:12px;">购买课程</button></div>							
								<%} %>
								<%if(("1").equals(cm.getHasCollection())) { %>
									<div style="float:right;margin-right:5px;"><button onclick="collectionClick('<%=cm.getId()%>', null)" style="height:25px;line-height:25px;padding:0px 5px;font-size:12px;" disabled>已经收藏</button></div>
								<%} else {%>
									<div style="float:right;margin-right:5px;"><button onclick="collectionClick('<%=cm.getId()%>', this)" style="height:25px;line-height:25px;padding:0px 5px;font-size:12px;">收藏课程</button></div>							
								<%} %>
							</div>
						</li>
						<%} %>
					</ul>
				</div>
				<%} %>
				</div>
			</div>
		</div>
		
		<div id="courseBrowser" class="mui-page" course_id="">
    		<div class="mui-navbar-inner mui-bar mui-bar-nav" style="background-color: #66d6a6;">
    			<button type="button" class="mui-left mui-action-back mui-btn  mui-btn-link mui-btn-nav mui-pull-left">
					<span class="mui-icon mui-icon-left-nav" style="color:white;"></span>
				</button>
				<h1 class="mui-center mui-title" style="color:white;">课程简介</h1>
			</div>
			<div class="mui-page-content" >
				<div class="mui-scroll-wrapper">
					<div class="mui-scroll">
						<div id="myTabContent" class="tab-content" style="display:none">
							<div class="tab-pane fade in active" id="summary">
								<div class="container">
									<div class="row csdetials">
										<div class="col-xs-12  mantoutitle"><span class="color-block"></span>导师简介</div>
										<div class="col-xs-12  mentername">
											<div class="row">
												<div class="col-xs-12">
													<div class="avatar">
														<img id="teacher_image" src="/files/imgs/" />
													</div>
												</div>
												<div class="col-xs-12">
													<div class="teacher-name" id="teacher_name"></div>
													<div class="teacher-title" id="teacher_position"></div>
													<div class="infolabel">
														<div>Ta的经验</div>
													</div>
													<p id="teacher_info"></p>
												</div>
											</div>
										</div>
										<div class="col-xs-12  mantoutitle"><span class="color-block"></span>适合人群</div>
										<div class="col-xs-12  courseintro">
											<p id="crowd"></p>
										</div>
										<div class="col-xs-12  mantoutitle"><span class="color-block"></span>课程简介</div>
										<div class="col-xs-12  courseintro">
											<p id="details"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>			
		</div>
		<div id="loadingToast" class="weui_loading_toast" style="display:none;">
	        <div class="weui_mask_transparent"></div>
	        <div class="weui_toast">
	            <div class="weui_loading">
	                <div class="weui_loading_leaf weui_loading_leaf_0"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_1"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_2"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_3"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_4"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_5"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_6"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_7"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_8"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_9"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_10"></div>
	                <div class="weui_loading_leaf weui_loading_leaf_11"></div>
	            </div>
	            <p id="loadingToastTips" style="color:white;" class="weui_toast_content">数据加载中</p>
	        </div>
        </div>
        <div id="collection_toast" style="display: none;">
	        <div class="weui_mask_transparent"></div>
	        <div class="weui_toast">
	            <i class="weui_icon_toast"></i>
	            <p class="weui_toast_content">已完成</p>
	        </div>
	    </div>
	</body>
	<script type="text/javascript" src="/js/weixinjs/mui.min.js" ></script>
    <script src="/js/weixinjs/mui.view.js"></script>
	<script src="/js/weixinjs/mui.picker.min.js"></script>
	<script src="/js/weixinjs/mui.poppicker.min.js"></script>
	<script src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
	<script type="text/javascript" charset="utf-8">
			mui.init({
				swipeBack:true,
				pullRefresh: {
					container: '#pullrefresh',
					up: {
						contentrefresh: '正在加载...',
						callback: pullupRefresh
					}
				}
			});
			var viewApi = mui('#ddcb_live_class').view({
		    	defaultPage: '#mainpage'
		    });
		    mui('.mui-scroll-wrapper').scroll();
		    var view = viewApi.view;
		    var oldBack = mui.back;
		    mui.back = function() {
		    	if (viewApi.canBack()) { //如果view可以后退，则执行view的后退
		    		viewApi.back();
		    	} else { //执行webview后退
		    		oldBack();
		    	}
		    };
			wx.config({
				appId: 'wx519f44ba99e2ec36',
				timestamp: <%=result.get("timestamp")%>,
				nonceStr: '<%=result.get("nonceStr")%>',
				signature: '<%=result.get("signature")%>',
				jsApiList: [
					'onMenuShareQQ',
					'onMenuShareTimeline',
					'onMenuShareAppMessage',
					'chooseWXPay'
				]
			});
			function collectionClick(courseId, ele) {
				this.event.stopPropagation();
				document.getElementById("loadingToastTips").innerHTML = "正在处理请求";
				document.getElementById("loadingToast").style.display = "";
				mui.ajax({
            		url: "/course/userCollectionCourse",
            		type: "POST",
            		data: {course_id:courseId},
            		success: function(data) {
            			document.getElementById("loadingToast").style.display = "none";
        				document.getElementById("loadingToastTips").innerHTML = "数据加载中";
            			if(data.error_code != "0") {
            				alert(data.error_msg);
            			} else {
            				document.getElementById("collection_toast").style.display = "";
            				setTimeout(function(){document.getElementById("collection_toast").style.display = "none";}, 1500);
            				ele.setAttribute("disabled", "true");
            				ele.innerHTML = "已经收藏";
            			}
            		},
            		error: function(status, error) {
            			document.getElementById("loadingToast").style.display = "none";
        				document.getElementById("loadingToastTips").innerHTML = "数据加载中";
            			alert("服务器暂时无法处理您的请求，请稍后重试！");
            		}
            	});
			}
			wx.ready(function() {
				var handler = function(event) {
					event.stopPropagation();
					document.getElementById("loadingToast").style.display = "";
					var ele = event.target;
					var courseId = ele.getAttribute("course_id");
					var coursePrice = ele.getAttribute("course_price");
					mui.ajax({
	            		url: '/userLiveClassWeixinPay',
	            		type: "POST",
	            		data: {fee:"0.01",course_id:courseId},
	            		success: function(data) {
	            			document.getElementById("loadingToast").style.display = "none";
	            			var jsonData = JSON.parse("{"+data+"}");
	            			if(jsonData.ddcb_error_msg != null) {
	            				alert(jsonData.ddcb_error_msg);
	            			} else {
	            				wx.chooseWXPay({
	            		            timestamp: jsonData.timeStamp,
	            		            nonceStr: jsonData.nonceStr,
	            		            package: jsonData.package,
	            		            signType: jsonData.signType,
	            		            paySign: jsonData.paySign,
	            		            success: function (res) {
	            		            	if(res.errMsg != null && res.errMsg == "chooseWXPay:ok") {
	                        				ele.innerHTML = "点击进入";
	                        				ele.removeEventListener('tap', handler);
	                        				ele.addEventListener('tap', enterClass);
	            		            		alert("支付成功!");
	            		            	} else {
	            		            		alert("支付失败！");
	            		            	}																            
	            		            },
	            		            fail:function(res) {
	            		            	alert(JSON.stringify(res));
	            		            }
	            		        });
	            			}
	            		},
	            		error: function(status, error) {
	            			alert("支付失败！");
	            		}
	            	});
				}
				mui(".buy_class").each(function(){
					this.addEventListener('tap', handler);
				});
			});
			function enterClass(event, btn) {
				var ele = event == null ? btn : event.target;
				var courseId = ele.getAttribute('course_id');
				window.location.href="/playDDCBLiveClass?course_id=" + courseId;
			}
			function checkJsonIsEmpty(json) {
				var isEmpty = true;
				if (json == null) return true;
				for (var jsonKey in json) {
					isEmpty = false;
					break;
				}
				return isEmpty;
			}
			var page = 1;
			var count = 8;
			var ajaxData = {page:page, count:count};
			var ajaxURL = "/course/getAllLiveCourseByPage";
			function pullupRefresh() {
				ajaxData.page = ajaxData.page + 1;
				mui.ajax({
            		url: ajaxURL,
            		type: "POST",
            		data: ajaxData,
            		success: function(data) {
            			if (!checkJsonIsEmpty(data)) {
            				var i = 0;
            				for (i in data) {
	    						var rootNode = document.getElementById("data_list");
	    						var liNode = document.createElement('li');
	    						liNode.setAttribute('class', 'mui-table-view-cell mui-media');
	    						liNode.setAttribute('course_id', data[i].id);
	    						var aNode = document.createElement('a');
	    						aNode.setAttribute('href', '#courseBrowser');
	    						var browserDiv = document.createElement('div');
	    						browserDiv.setAttribute('class', 'browser_class');
	    						browserDiv.setAttribute('course_id', data[i].id);
	    						var btnDiv = document.createElement('div');
	    						btnDiv.setAttribute('style', 'margin-top:5px');
	    						browserDiv.innerHTML = "<img class='mui-media-object mui-pull-left' style='height:50px;width:80px;max-width:100px;' src='/files/imgs/"+data[i].image+"'><div class='mui-media-body'><h4 style='font-size:12px;margin-top:0px;margin-bottom:0px;'>"+data[i].name+"</h4><h6 style='color:#2ab888;margin-top:2px;margin-bottom:2px;' class='mui-ellipsis'><span style='font-size:16px;' class='mui-icon mui-icon-contact'></span>"+data[i].teacher+"</h6><h6 style='color:#888888;margin-top:2px;margin-bottom:2px;' class='mui-ellipsis'><span style='font-size:16px;' class='mui-icon mui-icon-compose'></span>直播时间"+data[i].course_date_readable+"</h6></div>";
	    						btnDiv.innerHTML = "<div style='float:left;height:25px;line-height:25px;'><p style='font-size:12px;'>课程售价："+data[i].price+"元</p></div>";
	    						if(data[i].pay_status != null && data[i].pay_status=="1") {
	    							btnDiv.innerHTML += "<div style='float:right;'><button onclick='enterClass(null, this)' course_id='"+data[i].id+"' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>点击进入</button></div>";
	    						} else {
	    							btnDiv.innerHTML += "<div style='float:right;'><button class='buy_class' course_price='"+data[i].price+"' course_id='"+data[i].id+"' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>购买课程</button></div>";
	    						}
								if(data[i].hasCollection == "1") {
									btnDiv.innerHTML += "<div style='float:right;margin-right:5px;'><button onclick='collectionClick(\"" + data[i].id +"\")' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;' disabled>已经收藏</button></div>";
	    						} else {
	    							btnDiv.innerHTML += "<div style='float:right;margin-right:5px;'><button onclick='collectionClick(\"" + data[i].id +"\", this)' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>收藏课程</button></div>";
	    						}
								aNode.appendChild(browserDiv);
								liNode.appendChild(aNode);
								liNode.appendChild(btnDiv);
	    						rootNode.appendChild(liNode);
	    						browserDiv.addEventListener('tap',function(){
	    							document.getElementById("courseBrowser").setAttribute("course_id", this.getAttribute("course_id"));
	    					    });
            				}
            				if(i<7) {
            					mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
            				} else {
            					mui('#pullrefresh').pullRefresh().endPullupToRefresh(false);
            				}
    					} else {
    						mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
    					}
            		},
            		error: function(status, error) {
            			mui('#pullrefresh').pullRefresh().endPullupToRefresh(true);
            			alert("服务器暂时无法获取数据，请稍后重试！");
            		}
            	});
			}
			var searchOne = "";
			var searchTwo = "";
			var searchThree = "";
			var competencyData = [{value:'',text:"技术"},{value:'',text:"产品"},{value:'',text:"运营"},{	value:'',text:"市场"},{value:'',text:"招聘"},{value:'',text:"管理"},{value:'',text:"投融资"},{	value:'',text:"战略"}];
			var courseTypeData = [{
				value:'',
				text:'全部领域',
				children:[{value:'',text:'全部行业',children:[{value:'',text:'全部职能'}]}]
			},{
				value:'',
				text:'互联网',
				children:[{value:'',text:'社交',children:competencyData},{value:'',text:'游戏',children:competencyData},{value:'',text:'电商',children:competencyData},{value:'',text:'教育',children:competencyData},{value:'',text:'金融',children:competencyData},{value:'',text:'医疗',children:competencyData},{value:'',text:'旅游',children:competencyData},{value:'',text:'餐饮',children:competencyData},{value:'',text:'交通',children:competencyData},{value:'',text:'智能硬件',children:competencyData},{value:'',text:'可穿戴',children:competencyData},{value:'',text:'招聘',children:competencyData},{value:'',text:'工具',children:competencyData},{value:'',text:'O2O',children:competencyData},{value:'',text:'汽车',children:competencyData},{value:'',text:'房地产',children:competencyData},{value:'',text:'企业服务',children:competencyData},{value:'',text:'IT服务',children:competencyData},{value:'',text:'大数据',children:competencyData},{value:'',text:'传媒',children:competencyData},{value:'',text:'娱乐',children:competencyData},{value:'',text:'安全',children:competencyData},{value:'',text:'能源',children:competencyData},{value:'',text:'其它',children:competencyData}]
			}];
			function searchCourse(coursePicker) {
				coursePicker.hide();
				document.getElementById("loadingToast").style.display = "";
				if(searchOne == "全部领域") {
					ajaxData = {page:1,count:8};
					ajaxURL = "/course/getAllLiveCourseByPage";
					mui('#pullrefresh').pullRefresh().refresh(true);
					mui.ajax({
	            		url: ajaxURL,
	            		type: "POST",
	            		data: {page:1,count:8},
	            		success: function(data) {
	            			if (!checkJsonIsEmpty(data)) {
	            				var i = 0;
	            				var rootNode = document.getElementById("data_list");
	    						rootNode.innerHTML = "";
	            				for (i in data) {
		    						var liNode = document.createElement('li');
		    						liNode.setAttribute('class', 'mui-table-view-cell mui-media');
		    						liNode.setAttribute('course_id', data[i].id);
		    						var aNode = document.createElement('a');
		    						aNode.setAttribute('href', '#courseBrowser');
		    						var browserDiv = document.createElement('div');
		    						browserDiv.setAttribute('class', 'browser_class');
		    						browserDiv.setAttribute('course_id', data[i].id);
		    						var btnDiv = document.createElement('div');
		    						btnDiv.setAttribute('style', 'margin-top:5px');
		    						browserDiv.innerHTML = "<img class='mui-media-object mui-pull-left' style='height:50px;width:80px;max-width:100px;' src='/files/imgs/"+data[i].image+"'><div class='mui-media-body'><h4 style='font-size:12px;margin-top:0px;margin-bottom:0px;'>"+data[i].name+"</h4><h6 style='color:#2ab888;margin-top:2px;margin-bottom:2px;' class='mui-ellipsis'><span style='font-size:16px;' class='mui-icon mui-icon-contact'></span>"+data[i].teacher+"</h6><h6 style='color:#888888;margin-top:2px;margin-bottom:2px;' class='mui-ellipsis'><span style='font-size:16px;' class='mui-icon mui-icon-compose'></span>直播时间"+data[i].course_date_readable+"</h6></div>";
		    						btnDiv.innerHTML = "<div style='float:left;height:25px;line-height:25px;'><p style='font-size:12px;'>课程售价："+data[i].price+"元</p></div>";
		    						if(data[i].pay_status != null && data[i].pay_status=="1") {
		    							btnDiv.innerHTML += "<div style='float:right;'><button onclick='enterClass(null, this)' course_id='"+data[i].id+"' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>点击进入</button></div>";
		    						} else {
		    							btnDiv.innerHTML += "<div style='float:right;'><button class='buy_class' course_price='"+data[i].price+"' course_id='"+data[i].id+"' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>购买课程</button></div>";
		    						}
									if(data[i].hasCollection == "1") {
										btnDiv.innerHTML += "<div style='float:right;margin-right:5px;'><button onclick='collectionClick(\"" + data[i].id +"\")' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;' disabled>已经收藏</button></div>";
		    						} else {
		    							btnDiv.innerHTML += "<div style='float:right;margin-right:5px;'><button onclick='collectionClick(\"" + data[i].id +"\", this)' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>收藏课程</button></div>";
		    						}
									aNode.appendChild(browserDiv);
									liNode.appendChild(aNode);
									liNode.appendChild(btnDiv);
		    						rootNode.appendChild(liNode);
		    						browserDiv.addEventListener('tap',function(){
		    							document.getElementById("courseBrowser").setAttribute("course_id", this.getAttribute("course_id"));
		    					    });
	            				}
	    					} else {
	    						alert("您搜索的数据为空，请稍后重试！");
	    					}
	            			document.getElementById("loadingToast").style.display = "none";
	            		},
	            		error: function(status, error) {
	            			document.getElementById("loadingToast").style.display = "none";
	            			alert("服务器暂时无法获取导数据，请稍后重试！");
	            		}
	            	});
				} else {
					ajaxData ={field:searchOne,industry:searchTwo,competency:searchThree,page:1,count:8};
					ajaxURL = "/course/getAllLiveCourseByCondition";
					mui.ajax({
	            		url: '/course/getAllLiveCourseByCondition',
	            		type: "POST",
	            		data: {field:searchOne,industry:searchTwo,competency:searchThree,page:1,count:8},
	            		success: function(data) {
	            			if (!checkJsonIsEmpty(data)) {
	            				var i = 0;
	            				var rootNode = document.getElementById("data_list");
	    						rootNode.innerHTML = "";
	            				for (i in data) {
	            					var liNode = document.createElement('li');
	            					liNode.setAttribute('class', 'mui-table-view-cell mui-media');
		    						liNode.setAttribute('course_id', data[i].id);
		    						var aNode = document.createElement('a');
		    						aNode.setAttribute('href', '#courseBrowser');
		    						var browserDiv = document.createElement('div');
		    						browserDiv.setAttribute('class', 'browser_class');
		    						browserDiv.setAttribute('course_id', data[i].id);
		    						var btnDiv = document.createElement('div');
		    						btnDiv.setAttribute('style', 'margin-top:5px');
		    						browserDiv.innerHTML = "<img class='mui-media-object mui-pull-left' style='height:50px;width:80px;max-width:100px;' src='/files/imgs/"+data[i].image+"'><div class='mui-media-body'><h4 style='font-size:12px;margin-top:0px;margin-bottom:0px;'>"+data[i].name+"</h4><h6 style='color:#2ab888;margin-top:2px;margin-bottom:2px;' class='mui-ellipsis'><span style='font-size:16px;' class='mui-icon mui-icon-contact'></span>"+data[i].teacher+"</h6><h6 style='color:#888888;margin-top:2px;margin-bottom:2px;' class='mui-ellipsis'><span style='font-size:16px;' class='mui-icon mui-icon-compose'></span>直播时间"+data[i].course_date_readable+"</h6></div>";
		    						btnDiv.innerHTML = "<div style='float:left;height:25px;line-height:25px;'><p style='font-size:12px;'>课程售价："+data[i].price+"元</p></div>";
		    						if(data[i].pay_status != null && data[i].pay_status=="1") {
		    							btnDiv.innerHTML += "<div style='float:right;'><button onclick='enterClass(null, this)' course_id='"+data[i].id+"' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>点击进入</button></div>";
		    						} else {
		    							btnDiv.innerHTML += "<div style='float:right;'><button class='buy_class' course_price='"+data[i].price+"' course_id='"+data[i].id+"' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>购买课程</button></div>";
		    						}
									if(data[i].hasCollection == "1") {
										btnDiv.innerHTML += "<div style='float:right;margin-right:5px;'><button onclick='collectionClick(\"" + data[i].id +"\")' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;' disabled>已经收藏</button></div>";
		    						} else {
		    							btnDiv.innerHTML += "<div style='float:right;margin-right:5px;'><button onclick='collectionClick(\"" + data[i].id +"\", this)' style='height:25px;line-height:25px;padding:0px 5px;font-size:12px;'>收藏课程</button></div>";
		    						}
									aNode.appendChild(browserDiv);
									liNode.appendChild(aNode);
									liNode.appendChild(btnDiv);
		    						rootNode.appendChild(liNode);
		    						browserDiv.addEventListener('tap',function(){
		    							document.getElementById("courseBrowser").setAttribute("course_id", this.getAttribute("course_id"));
		    					    });
	            				}
	    					} else {
	    						ajaxURL = "/course/getAllOpenCourseByPage";
	    						alert("您搜索的数据为空，请稍后重试！");
	    					}
	            			document.getElementById("loadingToast").style.display = "none";
	            		},
	            		error: function(status, error) {
	            			document.getElementById("loadingToast").style.display = "none";
	            			alert("服务器暂时无法获取导数据，请稍后重试！");
	            		}
	            	});
				}
			}
			/* (function($, doc) {
				$.ready(function() {
					var coursePicker = new $.PopPicker({
						layer: 3
					});
					coursePicker.setData(courseTypeData);
					var searchButton = doc.getElementById('searchButton');
					searchButton.addEventListener('tap', function(event) {
						if(!hasData) return;
						coursePicker.show(function(items) {
							searchOne = (items[0] || {}).text;
							searchTwo = (items[1] || {}).text;
							searchThree = (items[2] || {}).text;
							searchCourse(coursePicker);
						});
					}, false);
				});
			})(mui, document); */
			var imgUrl = "http://www.dreamnotechina.com/img/weixinimg/share_img.jpg";
			var lineLink = window.location.href;
			var descContent = "梦想笔记---为进取心而生，专注职场“传、帮、带”";
			var shareTitle = "梦想笔记";
			<%if(list != null && !list.isEmpty()) {%>
				imgUrl = "http://www.dreamnotechina.com/files/imgs/<%=list.get(0).getImage()%>";
				descContent = "<%=list.get(0).getTeacher()%>";
				shareTitle = "<%=list.get(0).getName()%>";
			<%}%>
			wx.ready(function() {
				setTimeout(function() {
					wx.onMenuShareTimeline({
						title: shareTitle, // 分享标题
						link: lineLink, // 分享链接
						imgUrl: imgUrl, // 分享图标
						success: function() {
							// 用户确认分享后执行的回调函数
						},
						cancel: function() {
							// 用户取消分享后执行的回调函数
						}
					});
					wx.onMenuShareAppMessage({
						title: shareTitle, // 分享标题
						desc: descContent, // 分享描述
						link: lineLink, // 分享链接
						imgUrl: imgUrl, // 分享图标
						type: '', // 分享类型,music、video或link，不填默认为link
						dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
						success: function() {
							// 用户确认分享后执行的回调函数
						},
						cancel: function() {
							// 用户取消分享后执行的回调函数
						}
					});
					wx.onMenuShareQQ({
						title: shareTitle, // 分享标题
						desc: descContent, // 分享描述
						link: lineLink, // 分享链接
						imgUrl: imgUrl, // 分享图标
						success: function() {
							// 用户确认分享后执行的回调函数
						},
						cancel: function() {
							// 用户取消分享后执行的回调函数
						}
					});
				}, 500);
			});
			mui('.browser_class').each(function(){
				this.addEventListener('tap',function(){
					document.getElementById("courseBrowser").setAttribute("course_id", this.getAttribute("course_id"));
			    });
		    });
			var hasEnterPageShow = false;
		    view.addEventListener('pageShow', function(e) {
		    	if(!hasEnterPageShow && e.detail.page.id!="mainpage") {
		    		hasEnterPageShow = true;
		    		document.getElementById("loadingToast").style.display = "";
					var courseId = e.detail.page.getAttribute("course_id");
					mui.ajax({
	            		url: '/course/getLiveCourseByCourseId',
	            		type: "POST",
	            		data: {course_id:courseId},
	            		success: function(data) {
	            			document.getElementById("loadingToast").style.display = "none";
	            			if (!checkJsonIsEmpty(data)) {
	            				document.getElementById("myTabContent").style.display = "";
	            				document.getElementById('teacher_image').setAttribute('src', "/files/imgs/" + data[0].teacher_image);
	            				document.getElementById('teacher_name').innerHTML = data[0].teacher_name;
	            				document.getElementById('teacher_info').innerHTML = data[0].teacher_info;
	            				document.getElementById('teacher_position').innerHTML = data[0].teacher_position;
	            				document.getElementById('crowd').innerHTML = data[0].crowd;
	            				document.getElementById('details').innerHTML = data[0].details;
	    					} else {
	    						alert("服务器暂时无法获取当前课程数据，请稍后重试！");
	    					}
	            		},
	            		error: function(status, error) {
	            			document.getElementById("loadingToast").style.display = "none";
	            			alert("服务器暂时无法获取当前课程数据，请稍后重试！");
	            		}
	            	});
		    	}
			});
		    view.addEventListener('pageBack', function(e) {
		    	if(e.detail.page.id!="mainpage") {
		    		document.getElementById("myTabContent").style.display = "none";
			    	hasEnterPageShow = false;
		    	}
			});
		</script>
</html>
