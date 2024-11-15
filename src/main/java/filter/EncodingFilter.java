package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*")
public class EncodingFilter implements Filter{
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String uri = ((javax.servlet.http.HttpServletRequest) request).getRequestURI();

    // 정적 리소스의 경우 필터 처리하지 않음
    if (uri.endsWith(".css") || uri.endsWith(".js") || uri.endsWith(".png") || uri.endsWith(".jpg") || uri.endsWith(".jpeg") || uri.endsWith(".gif")) {
        chain.doFilter(request, response);
        return;
    }

    request.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    chain.doFilter(request, response);
	}
}
