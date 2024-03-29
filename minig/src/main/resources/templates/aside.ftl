<table cellspacing="0" cellpadding="0" class="leftPanel" ng-controller="FolderListCtrl">
	<tbody>
		<tr>
			<td align="left" style="vertical-align: top;">
				<table cellspacing="0" cellpadding="0" style="width: 100%;">
					<tbody>
						<tr>
							<td align="left" style="vertical-align: top;">
								<table cellspacing="0" cellpadding="0" class="decorativeButton">
									<tbody>
										<tr>
											<td class="image">
												<img src="images/envelope.png" class="gwt-Image">
											</td>
											<td>
												<a class="gwt-Anchor noWrap bold" href="#/composer">Mail composer</a>
											</td>
										</tr>
									</tbody>
								</table>	
							</td>
						</tr>
						<tr>
							<td align="left" style="vertical-align: top;">
								<a class="gwt-Anchor folderLink currentDefaultLinkSelected" ng-click="selectFolder()">Inbox</a>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: top;">
				<div class="gwt-HTML">&nbsp;</div>
			</td>
		</tr>
		<tr>
			<td align="left" style="vertical-align: top;">
				<table cellspacing="0" cellpadding="0" class="gwt-DisclosurePanel sidebarBox gwt-DisclosurePanel-open">
					<tbody>
						<tr>
							<td align="left" style="vertical-align: top;">								
								<table cellspacing="0" cellpadding="0" class="header">
									<tbody>
										<tr>											
											<td>Folders :</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td align="left" style="vertical-align: top;">
								<div style="padding: 0px; overflow: hidden;" aria-hidden="false">
									<table class="whiteBackground content" style="width: 100%;" aria-hidden="false">
										<tbody>
											<tr>
												<td colspan="2">
													<table cellspacing="0" cellpadding="0" class="labelsPanel" style="table-layout: auto;">
														<tbody>
															<tr>
																<td align="left" width="100%" style="vertical-align: top;">
																	<input type="text" class="gwt-TextBox" style="width: 97%;" ng-model="query">
																</td>
																<td align="left" style="vertical-align: middle;">
																	<div tabindex="0" class="gwt-CustomButton gwt-CustomButton-up" role="button" style="padding: 2px;" aria-pressed="false">
																		<input type="text" tabindex="-1" role="presentation"
																			style="opacity: 0; height: 1px; width: 1px; 
																			z-index: -1; overflow: hidden; position: absolute;">
																		<img src="images/x.gif" class="gwt-Image" ng-click="reset()">
																	</div>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<div style="overflow-x: hidden; overflow-y: scroll; position: relative;" class="labelsList">
														<div style="position: relative;">
															<table>
																<colgroup>
																	<col width="20px">
																</colgroup>
																<tbody>																
																	<tr ng-repeat="folder in folders | filter:query | subscribed">
																		<td>
																			<a class="gwt-Anchor noWrap" ng-click="selectFolder(folder.id)" title="{{folder.id}}">{{folder | prettyFolderName}}</a>
																		</td>
																	</tr>
																	<tr>
																		<td height="100%">
																			<div class="gwt-HTML">&nbsp;</div>
																		</td>
																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</td>
											</tr>
											<tr>
												<td colspan="2">
													<table cellspacing="0" cellpadding="0" class="bottomActions" style="table-layout: auto;">
														<tbody>
															<tr>
																<td align="right" style="vertical-align: top;">
																	<a class="gwt-Anchor" href="#/folder">Edit folders</a>
																</td>
															</tr>
														</tbody>
													</table>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</td>
		</tr>
	</tbody>
</table>