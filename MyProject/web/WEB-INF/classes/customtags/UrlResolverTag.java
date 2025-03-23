

import jakarta.servlet.jsp.tagext.SimpleTagSupport;
import jakarta.servlet.jsp.JspWriter;
import jakarta.servlet.jsp.JspException;

import java.io.IOException;

public class UrlResolverTag extends SimpleTagSupport {
    private String target;

    public void setTarget(String target) {
        this.target = target;
    }

    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();
        String resolvedUrl = resolveUrl(target);
        out.print(resolvedUrl);
    }

    private String resolveUrl(String target) {
        return target.startsWith("/") ? "../.." + target : target;
    }
}
