<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modaljs.aspx.cs" Inherits="GridsDataTables.Modaljs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="row" style="margin-top:5px;">
            <div class="span12">

                
                <div class="control-group" id="test-in-date">
                    <label class="control-label"><strong>Test-In Date</strong></label><div id="j_id0:applicationForm:j_id382"><script> if(!window.sfdcPage) { window.sfdcPage = new ApexDetailPage(); }UserContext.initialize({"ampm":["AM","PM"],"isAccessibleMode":false,"uiSkin":"PortalDefault","salesforceURL":"https://qa-builditgreen-main.cs13.force.com?refURL=https%3A%2F%2Fqa-builditgreen-main.cs13.force.com%2Fpgeportal%2FBIGPortalManageApplication","dateFormat":"M/d/yyyy","language":"en_US","locale":"en_US","userName":"big.demo@builditgreen.pge.qa","userId":"005W0000001mbmm","isCurrentlySysAdminSU":false,"renderMode":"RETRO","startOfWeek":"1","vfDomainPattern":"(?:[^.]+)*.cs13.visual.force.com","auraDomain":"cs13.lightning.force.com","dateTimeFormat":"M/d/yyyy h:mm a","orgPreferences":[{"index":257,"name":"TabOrganizer","value":true},{"index":113,"name":"GroupTasks","value":true}],"siteUrlPrefix":"/pgeportal","isDefaultNetwork":true,"labelLastModified":"1479964770000","today":"11/30/2016 5:34 AM","timeFormat":"h:mm a","userPreferences":[{"index":112,"name":"HideInlineEditSplash","value":false},{"index":114,"name":"OverrideTaskSendNotification","value":false},{"index":115,"name":"DefaultTaskSendNotification","value":false},{"index":119,"name":"HideUserLayoutStdFieldInfo","value":false},{"index":116,"name":"HideRPPWarning","value":false},{"index":87,"name":"HideInlineSchedulingSplash","value":false},{"index":88,"name":"HideCRUCNotification","value":false},{"index":89,"name":"HideNewPLESplash","value":false},{"index":90,"name":"HideNewPLEWarnIE6","value":false},{"index":122,"name":"HideOverrideSharingMessage","value":false},{"index":91,"name":"HideProfileILEWarn","value":false},{"index":93,"name":"HideProfileElvVideo","value":false},{"index":97,"name":"ShowPicklistEditSplash","value":false},{"index":92,"name":"HideDataCategorySplash","value":false},{"index":128,"name":"ShowDealView","value":false},{"index":129,"name":"HideDealViewGuidedTour","value":false},{"index":132,"name":"HideKnowledgeFirstTimeSetupMsg","value":false},{"index":104,"name":"DefaultOffEntityPermsMsg","value":false},{"index":135,"name":"HideNewCsnSplash","value":false},{"index":101,"name":"HideBrowserWarning","value":false},{"index":139,"name":"HideDashboardBuilderGuidedTour","value":false},{"index":140,"name":"HideSchedulingGuidedTour","value":false},{"index":180,"name":"HideReportBuilderGuidedTour","value":false},{"index":183,"name":"HideAssociationQueueCallout","value":false},{"index":194,"name":"HideQTEBanner","value":false},{"index":193,"name":"HideChatterOnboardingSplash","value":false},{"index":195,"name":"HideSecondChatterOnboardingSplash","value":false},{"index":270,"name":"HideIDEGuidedTour","value":false},{"index":282,"name":"HideQueryToolGuidedTour","value":false},{"index":196,"name":"HideCSIGuidedTour","value":false},{"index":271,"name":"HideFewmetGuidedTour","value":false},{"index":272,"name":"HideEditorGuidedTour","value":false},{"index":205,"name":"HideApexTestGuidedTour","value":false},{"index":206,"name":"HideSetupProfileHeaderTour","value":false},{"index":207,"name":"HideSetupProfileObjectsAndTabsTour","value":false},{"index":213,"name":"DefaultOffArticleTypeEntityPermMsg","value":false},{"index":214,"name":"HideSelfInfluenceGetStarted","value":false},{"index":215,"name":"HideOtherInfluenceGetStarted","value":false},{"index":216,"name":"HideFeedToggleGuidedTour","value":false},{"index":268,"name":"ShowChatterTab178GuidedTour","value":false},{"index":275,"name":"HidePeopleTabDeprecationMsg","value":false},{"index":276,"name":"HideGroupTabDeprecationMsg","value":false},{"index":224,"name":"HideUnifiedSearchGuidedTour","value":false},{"index":226,"name":"ShowDevContextMenu","value":true},{"index":227,"name":"HideWhatRecommenderForActivityQueues","value":false},{"index":228,"name":"HideLiveAgentFirstTimeSetupMsg","value":false},{"index":232,"name":"HideGroupAllowsGuestsMsgOnMemberWidget","value":false},{"index":233,"name":"HideGroupAllowsGuestsMsg","value":false},{"index":234,"name":"HideWhatAreGuestsMsg","value":false},{"index":235,"name":"HideNowAllowGuestsMsg","value":false},{"index":236,"name":"HideSocialAccountsAndContactsGuidedTour","value":false},{"index":237,"name":"HideAnalyticsHomeGuidedTour","value":false},{"index":238,"name":"ShowQuickCreateGuidedTour","value":false},{"index":245,"name":"HideFilePageGuidedTour","value":false},{"index":250,"name":"HideForecastingGuidedTour","value":false},{"index":251,"name":"HideBucketFieldGuide","value":false},{"index":263,"name":"HideSmartSearchCallOut","value":false},{"index":265,"name":"HideSocialProfilesKloutSplashScreen","value":false},{"index":273,"name":"ShowForecastingQuotaAttainment","value":false},{"index":280,"name":"HideForecastingQuotaColumn","value":false},{"index":301,"name":"HideManyWhoGuidedTour","value":false},{"index":284,"name":"HideExternalSharingModelGuidedTour","value":false},{"index":298,"name":"HideFileSyncBannerMsg","value":false},{"index":299,"name":"HideTestConsoleGuidedTour","value":false},{"index":302,"name":"HideManyWhoInlineEditTip","value":false},{"index":303,"name":"HideSetupV2WelcomeMessage","value":false},{"index":312,"name":"ForecastingShowQuantity","value":false},{"index":313,"name":"HideDataImporterIntroMsg","value":false},{"index":314,"name":"HideEnvironmentHubLightbox","value":false},{"index":316,"name":"HideSetupV2GuidedTour","value":false},{"index":317,"name":"HideFileSyncMobileDownloadDialog","value":false},{"index":322,"name":"HideEnhancedProfileHelpBubble","value":false},{"index":328,"name":"ForecastingHideZeroRows","value":false},{"index":330,"name":"HideEmbeddedComponentsFeatureCallout","value":false},{"index":341,"name":"HideDedupeMatchResultCallout","value":false},{"index":340,"name":"HideS1BrowserUI","value":false},{"index":346,"name":"HideS1Banner","value":false},{"index":358,"name":"HideEmailVerificationAlert","value":false},{"index":354,"name":"HideLearningPathModal","value":false},{"index":359,"name":"HideAtMentionsHelpBubble","value":false},{"index":368,"name":"LightningExperiencePreferred","value":true}],"networkId":""});
</script><span class="dateInput dateOnlyInput"><input  id="j_id0:applicationForm:testInDate" name="j_id0:applicationForm:testInDate" size="12" type="text" /></span></div><span id="j_id0:applicationForm:j_id383" style="display: none;"></span>
                </div>

                
                <div class="control-group" id="work-start-date">
                    <label class="control-label"><strong>Work Start Date</strong></label><div id="j_id0:applicationForm:j_id386"><span class="dateInput dateOnlyInput"><input  id="j_id0:applicationForm:workStartDate" name="j_id0:applicationForm:workStartDate" size="12" type="text" /></span></div><span id="j_id0:applicationForm:j_id387" style="display: none;"></span>
                </div>

                <div class="control-group" id="work-finish-date">
                    <label class="control-label"><strong>Work Finish Date</strong></label><div id="j_id0:applicationForm:j_id390"><span class="dateInput dateOnlyInput"><input  id="j_id0:applicationForm:workFinishDate" name="j_id0:applicationForm:workFinishDate" size="12" type="text" /></span></div><span id="j_id0:applicationForm:j_id391" style="display: none;"></span>
                </div>

                <div class="control-group" id="test-out-date">
                    <label class="control-label"><strong>Test-Out Date</strong></label><div id="j_id0:applicationForm:j_id394"><span class="dateInput dateOnlyInput"><input  id="j_id0:applicationForm:testOutDate" name="j_id0:applicationForm:testOutDate" size="12" type="text" /></span></div><span id="j_id0:applicationForm:j_id395" style="display: none;"></span>
                </div>

                <div class="control-group" id="BPI-Analyst">
                    <label class="control-label" style="text-align:left;width:381px;"><strong>BPI Analyst</strong> *</label>
                    <div style="margin-left:25px;"><span id="j_id0:applicationForm:j_id398" style="display: none;"></span><span id="j_id0:applicationForm:j_id403">
                            <select id="BPIAnalyst" name="BPIAnalyst">
                                <option></option><span id="j_id0:applicationForm:j_id405:0:j_id410">
                                            <option value="003W000000VCo7HIAT">aa, aa</option></span><span id="j_id0:applicationForm:j_id405:1:j_id410">
                                            <option value="003W000000VYOcBIAX">asd, asd</option></span><span id="j_id0:applicationForm:j_id405:2:j_id410">
                                            <option value="003W000000VYEwoIAH">asdasd, asdasd</option></span><span id="j_id0:applicationForm:j_id405:3:j_id410">
                                            <option value="003W000000VBkqIIAT">babaab, bababa</option></span><span id="j_id0:applicationForm:j_id405:4:j_id410">
                                            <option value="003W000000VYOZqIAP">duplica, test</option></span><span id="j_id0:applicationForm:j_id405:5:j_id410">
                                            <option value="003W000000VYJ9iIAH">Duplicate, test</option></span><span id="j_id0:applicationForm:j_id405:6:j_id410">
                                            <option value="003W000000VYDiVIAX">test, test</option></span><span id="j_id0:applicationForm:j_id405:7:j_id410">
                                            <option value="003W000000VXupsIAD">testone, testone</option></span><span id="j_id0:applicationForm:j_id405:8:j_id410">
                                            <option value="003W000000VXuoCIAT">testthree, testone</option></span>
                            </select>
                            <a class="btn btn-default" data-backdrop="static" data-controls-modal="#bpiAnalystModal" data-keyboard="false" data-target="#bpiAnalystModal" data-toggle="modal" style="padding:2px 5px 6px 6px;;"><i class="icon-plus icon-black" style="margin-top:3px;"></i></a></span>
                     </div>
                </div>

            </div>
        </div>

    <div class="attachments-wrapper">
        <h4>Attachments</h4>
        <div class="control-group">
            <label class="control-label" style="text-align:left;width:381px;">Rebate Assignment Form</label>
            <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file" dir="" id="j_id0:applicationForm:rebateAssignmetForm" lang="" name="j_id0:applicationForm:rebateAssignmetForm:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" style="text-align:left;width:381px;">Test-In Measurements (CAS) Form&nbsp;<span id="j_id0:applicationForm:j_id468">*</span></label>
            <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file" dir="" id="j_id0:applicationForm:testInMeasureCASForm" lang="" name="j_id0:applicationForm:testInMeasureCASForm:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" style="text-align:left;width:381px;">Test-Out Measurements (CAS) Form&nbsp;<span id="j_id0:applicationForm:j_id476">*</span></label>
            <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file" dir="" id="j_id0:applicationForm:testOutMeasureCASForm" lang="" name="j_id0:applicationForm:testOutMeasureCASForm:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" style="text-align:left;width:381px;">Safety &amp; Quality Acknowledgement (SQA) Form&nbsp;<span id="j_id0:applicationForm:j_id484">*</span></label>
            <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file" dir="" id="j_id0:applicationForm:casTestAcknowledgementForm" lang="" name="j_id0:applicationForm:casTestAcknowledgementForm:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" style="text-align:left;width:381px;">Building Permit (If required for scope of work)</label>
            <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file" dir="" id="j_id0:applicationForm:buildingPermit" lang="" name="j_id0:applicationForm:buildingPermit:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" style="text-align:left;width:381px;">Additional Documents (As necessary/if requested by reviewer)
                <h4>
                    <small>
                        <a class="help-icon" data-content="Photos, Specifications Documents, Heat Producing Devices (HPD) form, etc." data-html="true" data-placement="right" data-toggle="tooltip" data-trigger="hover">
                            <img src="/pgeportal/resource/1477526005000/acqccontractor/images/icon-help.png" />
                        </a>
                    </small>
                </h4>
            </label>
            <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file additionalAttachment" dir="" id="j_id0:applicationForm:additionalDocuments" lang="" name="j_id0:applicationForm:additionalDocuments:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
            </div>
        </div>
    </div>

    <h2 class="sub-header">NOTES</h2>

    <div id="conversation">
    <textarea id="notes" name="notes" placeholder="Anything else you'd like to tell us about this application or the attached documents?"></textarea>
    </div>
        <div class="form-actions" style="padding-left:25px;">
            <a class="btn btn-default disable-btn" href="/pgeportal/BIGPortalManageApplication">Cancel</a>&nbsp;<input type="submit" name="j_id0:applicationForm:j_id519" value="Save" onclick="removeJobCostInputValidation(); prepareSaveValidation();" class="btn btn-primary" />&nbsp;<input type="submit" name="j_id0:applicationForm:j_id521" value="Submit" onclick="prepareSubmitValidation();" class="btn btn-primary" />
        </div></span><span id="j_id0:applicationForm:j_id529">
                  
    <div class="modal hide fade" id="bpiAnalystModal" style="width: 540px;">
        <div class="modal-header">
            <h3 id="modalTitle">Add BPI Analyst</h3>
        </div>
        <div class="modal-body" style="max-height:400px;">
             <div class="form-horizontal" id="bpiForm">
                 <div id="errorModalBpi"></div>
                 <div class="span6">
                     <div class="control-group">
                         <label class="control-label">First Name *</label>
                         <div class="controls"><input id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputFirstName" type="text" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputFirstName" class="input-first-name" maxlength="40" />
                         </div>
                     </div>
                     <div class="control-group">
                         <label class="control-label">Last Name *</label>
                         <div class="controls"><input id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputLastName" type="text" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputLastName" class="input-last-name" maxlength="80" />
                         </div>
                     </div>
                     
                     <div class="control-group">
                         <label class="control-label">Email *</label>
                         <div class="controls"><input id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputEmail" type="text" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputEmail" class="input-email" />
                         </div>
                     </div>
                     
                     <div class="control-group">
                         <label class="control-label">Phone *</label>
                         <div class="controls"><input id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputPhone" type="text" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputPhone" class="input-phone" />
                         </div>
                     </div>
                     
                     <div class="control-group">
                         <label class="control-label">Extension</label>
                         <div class="controls"><input id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputPhoneExtension" type="text" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputPhoneExtension" class="input-phone-extension" maxlength="18" />
                         </div>
                     </div><span id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id541" style="display: none;"></span>
                     
                     <div id="bpiInfoSection">
                         <div class="control-group">
                             <label class="control-label">BPI ID Number *</label>
                             <div class="controls"><input id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputLicense" type="text" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputLicense" class="input-license" />
                             </div>
                         </div>
                         <div class="control-group">
                             <label class="control-label">Expiration Date *</label>
                             <div class="controls"><span class="dateInput dateOnlyInput"><input  class="input-license-exp-date" id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputLicenseExpDate" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:huInputLicenseExpDate" size="12" type="text" /></span>
                             </div>
                         </div><div id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id549" class="control-group">
                             <div class="control-label-div">
                                 <label class="control-label">BPI ID Card *<span class="optional-label">(both sides)</span></label>
                             </div> 
                             <div class="controls">
	        <input accept="" accessKey="" alt="" class="input-file bpi-file" dir="" id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:bpiFile" lang="" name="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:bpiFile:inputFile:file" onblur="" onchange="" onclick="" ondblclick="" onfocus="" onkeydown="" onkeypress="" onkeyup="" onmousedown="" onmousemove="" onmouseout="" onmouseover="" size="" style="" tabindex="" title="" type="file" />
                             </div></div>
                         
                     </div><div id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id559" class="control-group">
                         <div class="control-label-div">
                             <label class="control-label" style="width: 130px;"></label>
                         </div> 
                         <div class="controls">
                             <button class="btn btn-default bpiCancelModal" type="button">Cancel</button>&nbsp;
                             <button class="btn btn-primary" onclick="addHuBPIAnalyst();" type="button">Add</button>&nbsp;
                         </div></div><script id="j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id561" type="text/javascript">saveBPIAnalyst=function(fileName,fileSize){A4J.AJAX.Submit('j_id0:applicationForm',null,{'similarityGroupingId':'j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id561','oncomplete':function(request,event,data){activateButtonsBpiModal()},'parameters':{'fileName':(typeof fileName!='undefined'&&fileName!=null)?fileName:'','fileSize':(typeof fileSize!='undefined'&&fileSize!=null)?fileSize:'','j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id561':'j_id0:applicationForm:j_id529:bpiAnalystModalComponent:j_id561'} } )};
</script>

                 </div>
             </div>
         </div>

        <script>
            if (false) {
                sforce.connection.serverUrl = '/pgeportal/services/Soap/u/35.0';
                sforce.connection.sessionId = '00DW000000775Xc!ARAAQIb.geJr_YPuxt7t9i1dAHuSRgdkJClwf6dwlWhQ3xg.Xl4x2DXFI3YCtADxXfMeiWxA3MjPFdVZzCvlN1jGhdiJOdKU';
            }
            var MAX_BPI_FILE_SIZE = 5242880;
            var isValidBpi = true;

            $(document).ready(function() {
                if (false) {
                    bindEventsBpiModal();
                } else {
                    bindHuEventsBpiModal();
                }

                // Set-Up date picker for date fields
                $('.input-license-exp-date').attr('readonly', true);
                $('.input-license-exp-date').datepicker({
                    dateFormat: 'm/d/yy',
                    showOn: "both",
                    minDate: new Date(),
                    buttonImage: "/pgeportal/resource/1477526005000/bigutopia/img/calendar.png",
                    buttonImageOnly: true
                });

            });
            
            //------------------HU----------------------------------------
            function bindHuEventsBpiModal() {
                // The contact's logged in has a credential with bpi accreditation
                if (false) {
                    $('#bpiInfoSection').hide();
                }
                    
                $('#bpiAnalystModal').on('click', '.bpiCancelModal', function(e) {
                    isValidBpi = validatorBpiModal(false);
                    $('#bpiAnalystModal').modal('hide');
                });

                // Click on BPI Accreditation checkbox
                $('#bpiAnalystModal').on('click', '.chk-bpi-certified', function(e) {
                    if (this.checked) {
                            $('#bpiInfoSection').show();
                    } else {
                        $('#bpiInfoSection').hide();
                        $('.input-license').val('');
                        $('.input-license-exp-date').val('');
                        var inpFile = $('.bpi-file');
                        inpFile.replaceWith (inpFile = inpFile.clone(true));
                    }
                });
                    
                $('#bpiAnalystModal').on('hidden.bs.modal', function (e) {
                    removeValidations();
                });
            }
            
            function addHuBPIAnalyst() {
                if (validatorBpiModal(false)) {
                    //get values from modal
                    var BPIfname = $('.input-first-name').val();
                    var BPIlname = $('.input-last-name').val();
                    
                    if (!isDuplicated(BPIfname, BPIlname)) {
                        $("#errorMsg").empty().hide();
                        $('#bpiAnalystModal').modal('hide');

                        BPIfname = $.trim(BPIfname);
                        BPIlname = $.trim(BPIlname);

                        //add to option list
                        var newOption = '<option value="xxx" selected="selected">' + BPIlname + ', ' + BPIfname + '</option>';

                        $('#BPIAnalyst').append(newOption);
                    }
                }
            }












    </div>
    </form>
</body>
</html>
