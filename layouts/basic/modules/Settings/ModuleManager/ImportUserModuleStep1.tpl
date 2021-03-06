{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
	<div class="tpl-Settings-ModuleManager-ImportUserModuleStep1" id="importModules">
		<div class="widget_header row mb-2">
			<div class="col-12">
				{include file=\App\Layout::getTemplatePath('BreadCrumbs.tpl', $MODULE_NAME)}
			</div>
		</div>
		{assign var=MAXUPLOADSIZE value=vtlib\Functions::getMaxUploadSize()}
		{if $MAXUPLOADSIZE < 5242880}
			<div class="alert alert-block alert-danger fade show" role="alert">
				<button type="button" class="close" data-dismiss="alert">×</button>
				<h4 class="alert-heading">{\App\Language::translate('LBL_TOO_SMALL_UPLOAD_LIMIT', $QUALIFIED_MODULE)}</h4>
				<p>{\App\Language::translateArgs('LBL_TOO_SMALL_UPLOAD_LIMIT_DESC', $QUALIFIED_MODULE, vtlib\Functions::showBytes($MAXUPLOADSIZE),'<a href="index.php?parent=Settings&module=ConfReport&view=Index">'|cat:\App\Language::translate('LBL_CHECK_SERVER_CONFIG',$QUALIFIED_MODULE)|cat:'</a>')}</p>
			</div>
		{/if}
		<div class="contents">
			<div>
				<form class="form-horizontal contentsBackground" id="importUserModule" name="importUserModule"
					  action='index.php' method="POST" enctype="multipart/form-data">
					<input type="hidden" name="module" value="ModuleManager"/>
					<input type="hidden" name="moduleAction" value="Import"/>
					<input type="hidden" name="parent" value="Settings"/>
					<input type="hidden" name="view" value="ModuleImport"/>
					<input type="hidden" name="mode" value="importUserModuleStep2"/>
					<div name="uploadUserModule">
						<div class="modal-body tabbable">
							<div class="tab-content massEditContent">
								<table class="massEditTable table table-bordered">
									<tr>
										<td class="fieldLabel alignMiddle">{\App\Language::translate('LBL_IMPORT_MODULE_FROM_FILE', $QUALIFIED_MODULE)}</td>
										<td class="fieldValue">
											<input type="file" name="moduleZip" id="moduleZip" size="80px"
												   data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
												   data-validator={\App\Json::encode([['name'=>'UploadModuleZip']])}
											/>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-success" type="submit" name="saveButton">
							<strong>{\App\Language::translate('LBL_IMPORT', $QUALIFIED_MODULE)}</strong>
						</button>
						<div class="float-right cancelLinkContainer">
							<a class="cancelLink btn btn-warning"
							   href="index.php?module=ModuleManager&parent=Settings&view=List">{\App\Language::translate('LBL_CANCEL', $QUALIFIED_MODULE)}</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
{/strip}
