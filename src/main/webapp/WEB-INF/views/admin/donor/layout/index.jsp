  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <div id="LAY_app">
    <div class="layui-layout layui-layout-admin">
      <div class="layui-header">
        <!-- 头部区域 -->
        <ul class="layui-nav layui-layout-left">
          <li class="layui-nav-item layadmin-flexible" lay-unselect>
            <a href="javascript:;" layadmin-event="flexible" title="侧边伸缩">
              <i class="layui-icon layui-icon-shrink-right" id="LAY_app_flexible"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="${pageContext.request.contextPath}/index" target="_blank" title="前台">
              <i class="layui-icon layui-icon-website"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:window.location.reload();" layadmin-event="refresh" title="刷新">
              <i class="layui-icon layui-icon-refresh-3"></i>
            </a>
          </li>
        </ul>
        <ul class="layui-nav layui-layout-right" lay-filter="layadmin-layout-right">
          
<%--          <li class="layui-nav-item" lay-unselect>--%>
<%--            <a lay-href="app/message/index.html" layadmin-event="message" lay-text="消息中心">--%>
<%--              <i class="layui-icon layui-icon-notice"></i>  --%>
<%--              --%>
<%--              <!-- 如果有新消息，则显示小圆点 -->--%>
<%--              <span class="layui-badge-dot"></span>--%>
<%--            </a>--%>
<%--          </li>--%>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="theme">
              <i class="layui-icon layui-icon-theme"></i>
            </a>
          </li>
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="note">
              <i class="layui-icon layui-icon-note"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;">
              <cite>${user.name}</cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a href="${pageContext.request.contextPath}/donor/info">基本资料</a></dd>
              <dd><a href="${pageContext.request.contextPath}/donor/setPassword">修改密码</a></dd>
              <hr>
              <dd style="text-align: center;"><a href="${pageContext.request.contextPath}/user/logout">退出</a></dd>
            </dl>
          </li>

          <li class="layui-nav-item layui-hide-xs" lay-unselect>
              &nbsp;&nbsp;&nbsp;
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="${pageContext.request.contextPath}/donor/index">
            <span>个人中心</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">
            <li data-name="home" class="layui-nav-item">
              <a href="${pageContext.request.contextPath}/donor/index" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
            </li>
            <li data-name="addAuthority" class="layui-nav-item">
              <a href="${pageContext.request.contextPath}/donor/info" lay-tips="个人信息" lay-direction="2">
                <i class="layui-icon layui-icon-user"></i>
                <cite>个人信息</cite>
              </a>
            </li>
            <li data-name="manageAuthority" class="layui-nav-item">
              <a href="${pageContext.request.contextPath}/donor/history" lay-tips="捐赠记录" lay-direction="2">
                <i class="layui-icon layui-icon-template"></i>
                <cite>捐赠记录</cite>
              </a>
            </li>
          </ul>
        </div>
      </div>