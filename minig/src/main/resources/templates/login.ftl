<#assign jwr=JspTaglibs["/META-INF/jawr.tld"] />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<!-- Force rendering with google chrome for IE users -->
		<meta content="chrome=1" http-equiv="X-UA-Compatible">
		<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
	
	    <link rel="icon" type="image/gif" href="images/favicon.ico">
	    <@jwr.style src="/bundles/styles.css" />
	
		<title>MiniG</title>
	</head>
	<body id="page_body">	
		<div id="webmail_root">
			<form action="check" method="post">
			<table cellspacing="4" cellpadding="0" style="width: 100%; height: 100%;">
				<tbody>
					<tr>
						<td align="center" style="vertical-align: middle;">
							<table cellspacing="0" cellpadding="0">
								<tbody>
									<tr>
										<td align="center" style="vertical-align: top;" colspan="1">
											<img src="images/logo_minig_big.png" class="gwt-Image"></td>
									</tr>
									<tr>
										<td width="" align="center" height=""
											style="vertical-align: top;" colspan="1"><div
												class="gwt-HTML" style="height: 30px;">&nbsp;</div></td>
									</tr>
									<tr>
										<td width="" align="center" height=""
											style="vertical-align: top;">
											
											<table>
												<colgroup>
													<col>
													<col>
												</colgroup>
												<tbody>
													<tr>
														<td>Username@domain:</td>
														<td><input type="text" name="username" class="gwt-TextBox"
															style="width: 20em;"></td>
													</tr>
													<tr>
														<td>Password:</td>
														<td><input type="password" name="password" class="gwt-PasswordTextBox"
															style="width: 20em;"></td>
													</tr>
													<tr>
														<td>&nbsp;</td>
														<td>&nbsp;</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
	
									<tr>
										<td width="" align="center" height=""
											style="vertical-align: top;" colspan="1"><input type="submit"
												type="button" class="gwt-Button" value="Login"></input></td>
									</tr>
								</tbody>
							</table></td>
					</tr>
				</tbody>
			</table>
			</form>
		</div>
	</body>
</html>