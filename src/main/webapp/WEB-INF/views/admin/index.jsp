<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ include file="/WEB-INF/views/layout/admin/header.jsp" %> <!-- header -->

<section>
	<%@ include file="/WEB-INF/views/layout/admin/leftMenu.jsp" %>
	<article class="article">
	    <div class="contents">
	        Contents / ${admin}
	    </div>
	</article>
</section>

</body>
</html>
