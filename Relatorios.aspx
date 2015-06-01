<%@ Reference VirtualPath="~masterurl/custom.master" %>
<%@ Page language="C#"   Inherits="Microsoft.SharePoint.Publishing.PublishingLayoutPage,Microsoft.SharePoint.Publishing,Version=15.0.0.0,Culture=neutral,PublicKeyToken=71e9bce111e9429c" meta:progid="SharePoint.WebPartPage.Document" %>
<%@ Register Tagprefix="SharePointWebControls" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingWebControls" Namespace="Microsoft.SharePoint.Publishing.WebControls" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %> <%@ Register Tagprefix="PublishingNavigation" Namespace="Microsoft.SharePoint.Publishing.Navigation" Assembly="Microsoft.SharePoint.Publishing, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
	<asp:Content ContentPlaceholderID="PlaceHolderAdditionalPageHead" runat="server">
		<style type="text/css">
			#Relatorio li{
			   float:left;
			}
			.loading{	
    			width: 100%;
    			text-align: center;
    			margin-top: 25px;
			}
			.PageOptions{
				display:none;
			}
			.toglee{
	            padding: 100px;
			}
			.togleeEnd{
	            padding: 100px;
			}

		</style>

		<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server" __designer:Preview="&lt;link rel=&quot;stylesheet&quot; type=&quot;text/css&quot; href=&quot;/sites/imunizacao/Style%20Library/en-US/Themable/Core%20Styles/pagelayouts15.css&quot;/&gt;
" __designer:Values="&lt;P N=&#39;Name&#39; Bound=&#39;True&#39; T=&#39;SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css&#39; /&gt;&lt;P N=&#39;EnableCssTheming&#39; Serial=&#39;AAEAAAD/////AQAAAAAAAAAEAQAAAA5TeXN0ZW0uQm9vbGVhbgEAAAAHbV92YWx1ZQABAQs&#39; /&gt;&lt;P N=&#39;InDesign&#39; T=&#39;False&#39; /&gt;&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl00&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"/>
		<PublishingWebControls:EditModePanel runat="server" __designer:Preview="&lt;Regions&gt;&lt;Region Name=&quot;0&quot; Editable=&quot;True&quot; Content=&quot;&amp;#xD;&amp;#xA;			&amp;lt;!-- Styles for edit mode only--&amp;gt;&amp;#xD;&amp;#xA;			&amp;lt;SharePointWebControls:CssRegistration name=&amp;quot;&amp;lt;% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %&amp;gt;&amp;quot;&amp;#xD;&amp;#xA;				After=&amp;quot;&amp;lt;% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %&amp;gt;&amp;quot; runat=&amp;quot;server&amp;quot; __designer:Preview=&amp;quot;&amp;amp;lt;link rel=&amp;amp;quot;stylesheet&amp;amp;quot; type=&amp;amp;quot;text/css&amp;amp;quot; href=&amp;amp;quot;/sites/imunizacao/Style%20Library/en-US/Themable/Core%20Styles/editmode15.css&amp;amp;quot;/&amp;amp;gt;&amp;#xA;&amp;quot; __designer:Values=&amp;quot;&amp;amp;lt;P N=&amp;amp;#39;Name&amp;amp;#39; Bound=&amp;amp;#39;True&amp;amp;#39; T=&amp;amp;#39;SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;EnableCssTheming&amp;amp;#39; Serial=&amp;amp;#39;AAEAAAD/////AQAAAAAAAAAEAQAAAA5TeXN0ZW0uQm9vbGVhbgEAAAAHbV92YWx1ZQABAQs&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;After&amp;amp;#39; Bound=&amp;amp;#39;True&amp;amp;#39; T=&amp;amp;#39;SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;InDesign&amp;amp;#39; T=&amp;amp;#39;False&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;ID&amp;amp;#39; T=&amp;amp;#39;ctl00&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;Page&amp;amp;#39; ID=&amp;amp;#39;1&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;TemplateControl&amp;amp;#39; R=&amp;amp;#39;1&amp;amp;#39; /&amp;amp;gt;&amp;amp;lt;P N=&amp;amp;#39;AppRelativeTemplateSourceDirectory&amp;amp;#39; R=&amp;amp;#39;-1&amp;amp;#39; /&amp;amp;gt;&amp;quot;/&amp;gt;&amp;#xD;&amp;#xA;		&quot; /&gt;&lt;/Regions&gt;
			&lt;!-- Styles for edit mode only--&gt;
			&lt;SharePointWebControls:CssRegistration name=&quot;&lt;% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %&gt;&quot;
				After=&quot;&lt;% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %&gt;&quot; runat=&quot;server&quot;/&gt;
		" __designer:Values="&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl01&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;&lt;P N=&#39;Visible&#39; T=&#39;False&#39; /&gt;">
			<!-- Styles for edit mode only-->
			<SharePointWebControls:CssRegistration name="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/editmode15.css %>"
				After="<% $SPUrl:~sitecollection/Style Library/~language/Themable/Core Styles/pagelayouts15.css %>" runat="server"/>
		</PublishingWebControls:EditModePanel>
	</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitle" runat="server">
	<SharePointWebControls:ListProperty Property="Title" runat="server" __designer:Preview="Pages" __designer:Values="&lt;P N=&#39;Property&#39; T=&#39;Title&#39; /&gt;&lt;P N=&#39;InDesign&#39; T=&#39;False&#39; /&gt;&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl02&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"/> - 
	<SharePointWebControls:FieldValue FieldName="Title" runat="server" __designer:Preview="CentroImunizacao" __designer:Values="&lt;P N=&#39;FieldName&#39; T=&#39;Title&#39; /&gt;&lt;P N=&#39;ItemFieldValue&#39; ID=&#39;1&#39; Serial=&#39;AAEAAAD/////AQAAAAAAAAAGAQAAABBDZW50cm9JbXVuaXphY2FvCw&#39; /&gt;&lt;P N=&#39;ListItemFieldValue&#39; R=&#39;1&#39; /&gt;&lt;P N=&#39;Visible&#39; T=&#39;True&#39; /&gt;&lt;P N=&#39;ControlMode&#39; E=&#39;1&#39; /&gt;&lt;P N=&#39;InDesign&#39; T=&#39;False&#39; /&gt;&lt;P N=&#39;ID&#39; ID=&#39;2&#39; T=&#39;ctl03&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;3&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;3&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageTitleInTitleArea" runat="server">
	<SharePointWebControls:FieldValue FieldName="Title" runat="server" __designer:Preview="CentroImunizacao" __designer:Values="&lt;P N=&#39;FieldName&#39; T=&#39;Title&#39; /&gt;&lt;P N=&#39;ItemFieldValue&#39; ID=&#39;1&#39; Serial=&#39;AAEAAAD/////AQAAAAAAAAAGAQAAABBDZW50cm9JbXVuaXphY2FvCw&#39; /&gt;&lt;P N=&#39;ListItemFieldValue&#39; R=&#39;1&#39; /&gt;&lt;P N=&#39;Visible&#39; T=&#39;True&#39; /&gt;&lt;P N=&#39;ControlMode&#39; E=&#39;1&#39; /&gt;&lt;P N=&#39;InDesign&#39; T=&#39;False&#39; /&gt;&lt;P N=&#39;ID&#39; ID=&#39;2&#39; T=&#39;ctl04&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;3&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;3&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderTitleBreadcrumb" runat="server"> 
	<SharePointWebControls:ListSiteMapPath runat="server" SiteMapProviders="CurrentNavigationSwitchableProvider" RenderCurrentNodeAsLink="false" PathSeparator="" CssClass="s4-breadcrumb" NodeStyle-CssClass="s4-breadcrumbNode" CurrentNodeStyle-CssClass="s4-breadcrumbCurrentNode" RootNodeStyle-CssClass="s4-breadcrumbRootNode" NodeImageOffsetX=0 NodeImageOffsetY=289 NodeImageWidth=16 NodeImageHeight=16 NodeImageUrl="/_layouts/15/images/fgimg.png?rev=23" HideInteriorRootNodes="true" SkipLinkText="" __designer:Preview="&lt;ul class=&quot;s4-breadcrumb&quot;&gt;

&lt;/ul&gt;" __designer:Values="&lt;P N=&#39;SiteMapProviders&#39; T=&#39;CurrentNavigationSwitchableProvider&#39; /&gt;&lt;P N=&#39;CssClass&#39; T=&#39;s4-breadcrumb&#39; /&gt;&lt;P N=&#39;PathSeparator&#39; R=&#39;-1&#39; /&gt;&lt;P N=&#39;HideInteriorRootNodes&#39; T=&#39;True&#39; /&gt;&lt;P N=&#39;NodeImageOffsetY&#39; T=&#39;289&#39; /&gt;&lt;P N=&#39;NodeImageWidth&#39; T=&#39;16&#39; /&gt;&lt;P N=&#39;NodeImageHeight&#39; T=&#39;16&#39; /&gt;&lt;P N=&#39;NodeImageUrl&#39; T=&#39;/_layouts/15/images/fgimg.png?rev=23&#39; /&gt;&lt;P N=&#39;SkipLinkText&#39; R=&#39;-1&#39; /&gt;&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl05&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;" __designer:Templates="&lt;Group Name=&quot;NodeTemplate&quot;&gt;&lt;Template Name=&quot;NodeTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;&lt;Group Name=&quot;CurrentNodeTemplate&quot;&gt;&lt;Template Name=&quot;CurrentNodeTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;&lt;Group Name=&quot;RootNodeTemplate&quot;&gt;&lt;Template Name=&quot;RootNodeTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;&lt;Group Name=&quot;PathSeparatorTemplate&quot;&gt;&lt;Template Name=&quot;PathSeparatorTemplate&quot; Content=&quot;&quot; /&gt;&lt;/Group&gt;"/> </asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderPageDescription" runat="server">
	<SharePointWebControls:ProjectProperty Property="Description" runat="server" __designer:Preview="" __designer:Values="&lt;P N=&#39;Property&#39; T=&#39;Description&#39; /&gt;&lt;P N=&#39;InDesign&#39; T=&#39;False&#39; /&gt;&lt;P N=&#39;ID&#39; ID=&#39;1&#39; T=&#39;ctl07&#39; /&gt;&lt;P N=&#39;Page&#39; ID=&#39;2&#39; /&gt;&lt;P N=&#39;TemplateControl&#39; R=&#39;2&#39; /&gt;&lt;P N=&#39;AppRelativeTemplateSourceDirectory&#39; R=&#39;-1&#39; /&gt;"/>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderBodyRightMargin" runat="server">
	<div height=100% class="ms-pagemargin"><IMG SRC="/_layouts/images/blank.gif" width=10 height=1 alt=""></div>
</asp:Content>
<asp:Content ContentPlaceHolderId="PlaceHolderMain" runat="server">
<SharePoint:ScriptLink language="javascript" name="~SiteCollection/Style Library/js/ProMatre.Relatorios.js" runat="server" />
<WebPartPages:SPProxyWebPartManager runat="server" id="spproxywebpartmanager"></WebPartPages:SPProxyWebPartManager>
<p></p>
<div id="events">
	<table class="Quad Clear Body" width="100%">
		<tr>
			<td>
				<select class="select">
					<option value="1">Vacina Dia Mes</option>
					<option value="2">n/d</option>
					<option value="3">n/d</option>
					<option value="4">n/d</option>		
				</select>
			</td>
			<td><label>Data Inicio: </label><input style="width: 100px!Important;" class="dtInit" type="text" value=""/></td>
			<td><label>Data Fim: </label><input style="width: 100px!Important;" class="dtEnd" type="text" value=""/></td>
			<td><input type="button" id="search" value="PESQUISAR"/></td>
		</tr>
	</table>
	<div class="loading">
		<img src="../Style Library/images/ajax-loader.gif"/>
	</div>
	
	<div class="idInit" data-idInit="0"></div>
	<div class="idEnd" data-idEnd="0"></div>
	
	<table class="Ficha Header" width="100%" style="margin-top:30px;">
	</table>
	<table class="Quad Clear Body PageOptions" width="100%" style="margin-top: 28px;">
		<tr>
			<td><label class="toglee"></label></td>
			<td><label class="toglee"></label></td>
			<td><input type="button" id="first" value="PRIMEIRA"/></td>
			<td><input type="button" id="previous" value="ANTERIOR"/></td>
			<td><label>Pagina:</label><label class="PageCurrent"></label> DE <label class="PageCount"></label></td>
			<td><input type="button" id="next" value="PROXIMA"/></td>
			<td><input type="button" id="last" value="ULTIMA"/></td>
			<td><label class="togleeEnd"></label></td>
			<td><label class="togleeEnd"></label></td>

		</tr>
	</table>
</div>		
</asp:Content>
