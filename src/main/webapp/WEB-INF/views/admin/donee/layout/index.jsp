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
            <a href="http://www.layui.com/admin/" target="_blank" title="前台">
              <i class="layui-icon layui-icon-website"></i>
            </a>
          </li>
          <li class="layui-nav-item" lay-unselect>
            <a href="javascript:;" layadmin-event="refresh" title="刷新">
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
              <cite>贤心</cite>
            </a>
            <dl class="layui-nav-child">
              <dd><a lay-href="set/user/info.html">基本资料</a></dd>
              <dd><a lay-href="set/user/password.html">修改密码</a></dd>
              <hr>
              <dd layadmin-event="logout" style="text-align: center;"><a>退出</a></dd>
            </dl>
          </li>
          
          <li class="layui-nav-item layui-hide-xs" lay-unselect>
            <a href="javascript:;" layadmin-event="about"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
          <li class="layui-nav-item layui-show-xs-inline-block layui-hide-sm" lay-unselect>
            <a href="javascript:;" layadmin-event="more"><i class="layui-icon layui-icon-more-vertical"></i></a>
          </li>
        </ul>
      </div>
      
      <!-- 侧边菜单 -->
      <div class="layui-side layui-side-menu">
        <div class="layui-side-scroll">
          <div class="layui-logo" lay-href="home/console.html">
            <span>layuiAdmin</span>
          </div>
          
          <ul class="layui-nav layui-nav-tree" lay-shrink="all" id="LAY-system-side-menu" lay-filter="layadmin-system-side-menu">

            <li data-name="home" class="layui-nav-item">
              <a href="${pageContext.request.contextPath}/authority/index" lay-tips="主页" lay-direction="2">
                <i class="layui-icon layui-icon-home"></i>
                <cite>主页</cite>
              </a>
            </li>

            <li data-name="addAuthority" class="layui-nav-item">
              <a href="${pageContext.request.contextPath}/authority/addApplication" lay-tips="发起捐赠" lay-direction="2">
                <i class="layui-icon layui-icon-add-1"></i>
                <cite>发起捐赠</cite>
              </a>
            </li>

            <li data-name="manageAuthority" class="layui-nav-item">
              <a href="${pageContext.request.contextPath}/authority/manageApplication" lay-tips="受赠历史" lay-direction="2">
                <i class="layui-icon layui-icon-template"></i>
                <cite>受赠</cite>
              </a>
            </li>
          </ul>
        </div>
      </div>