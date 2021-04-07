---@class UIRoot_actionProgression: FlashObject @actionProgression
---@field container_mc FlashObject
---@field events FlashArray
---@field layout string
---@field frame_width number
---@field frame_height number
---@field frameSpacing number
---@field pb_array FlashArray
actionProgression = {}

function actionProgression.MainTimeline() end

---@param param1 number
---@param param2 number
function actionProgression.setWindow(param1, param2) end

function actionProgression.onEventInit() end

---@param param1 number
function actionProgression.setAnchor(param1) end

function actionProgression.onEventResize() end

function actionProgression.resetAllPbPositions() end

---@param param1 number
function actionProgression.removeProgressionBar(param1) end

function actionProgression.clearAll() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 string
function actionProgression.showProgressionBar(param1, param2, param3, param4, param5) end

---@param param1 FlashObject
---@param param2 string
function actionProgression.addIggyIcon(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function actionProgression.removeChildrenOf(param1) end

---@param param1 number
---@return FlashObject
function actionProgression.getPBar(param1) end

---@param param1 FlashObject
---@param param2 number
---@param param3 number
function actionProgression.checkTooltipBoundaries(param1, param2, param3) end

---@class UIRoot_addContent: FlashObject @addContent
---@field addContent_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field events FlashArray
---@field layout string
addContent = {}

function addContent.MainTimeline() end

function addContent.onEventInit() end

function addContent.onEventResize() end

---@param param1 number
---@return boolean
function addContent.onEventUp(param1) end

function addContent.next() end

function addContent.previous() end

---@param param1 string
---@param param2 string
---@return boolean
function addContent.startsWith(param1, param2) end

---@param param1 number
---@return boolean
function addContent.onEventDown(param1) end

function addContent.fadeIn() end

function addContent.fadeOut() end

function addContent.slideIn() end

function addContent.requestClose() end

function addContent.requestHide() end

function addContent.requestDestroy() end

---@param param1 number
---@param param2 string
function addContent.setText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function addContent.setContent(param1, param2, param3, param4) end

function addContent.updateDone() end

function addContent.clearContentList() end

function addContent.sortContentList() end

---@param param1 number
---@param param2 string
function addContent.setBtnText(param1, param2) end

---@param param1 number
---@param param2 boolean
function addContent.setBtnDisabled(param1, param2) end

---@class UIRoot_addContent_c: FlashObject @addContent_c
---@field addContent_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field events FlashArray
---@field layout string
addContent_c = {}

function addContent_c.MainTimeline() end

function addContent_c.onEventInit() end

function addContent_c.onEventResize() end

---@param param1 number
---@return boolean
function addContent_c.onEventUp(param1) end

function addContent_c.next() end

function addContent_c.previous() end

---@param param1 number
---@param param2 number
---@param param3 string
function addContent_c.addBtnHint(param1, param2, param3) end

function addContent_c.clearBtnHints() end

---@param param1 string
---@param param2 string
---@return boolean
function addContent_c.startsWith(param1, param2) end

---@param param1 number
---@return boolean
function addContent_c.onEventDown(param1) end

function addContent_c.fadeIn() end

function addContent_c.fadeOut() end

function addContent_c.slideIn() end

function addContent_c.requestClose() end

function addContent_c.requestHide() end

function addContent_c.requestDestroy() end

---@param param1 number
---@param param2 string
function addContent_c.setText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function addContent_c.setContent(param1, param2, param3, param4) end

function addContent_c.updateDone() end

function addContent_c.clearContentList() end

function addContent_c.sortContentList() end

---@param param1 number
---@param param2 string
function addContent_c.setBtnText(param1, param2) end

---@param param1 number
---@param param2 boolean
function addContent_c.setBtnDisabled(param1, param2) end

---@class UIRoot_arenaResult: FlashObject @arenaResult
---@field resultPanel_mc FlashObject
---@field events FlashArray
---@field layout string
---@field score_text string
---@field less_text string
---@field more_text string
---@field kills_text string
---@field damage_text string
---@field heal_text string
---@field btn_array FlashArray
---@field console_hints_txt_array FlashArray
---@field console_hints_icon_array FlashArray
---@field rematchShowTimer FlashObject
---@field text_array FlashArray
---@field string_array FlashArray
---@field team_array FlashArray
---@field player_array FlashArray
---@field hero_array FlashArray
arenaResult = {}

function arenaResult.MainTimeline() end

function arenaResult.onEventInit() end

---@param param1 FlashObject
function arenaResult.onButtonPressed(param1) end

---@param param1 number
---@param param2 string
function arenaResult.setButtonText(param1, param2) end

---@param param1 number
---@param param2 boolean
function arenaResult.setButtonDisabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function arenaResult.setButtonVisible(param1, param2) end

function arenaResult.showRematch() end

---@param param1 boolean
function arenaResult.setControllerMode(param1) end

function arenaResult.hideRematch() end

---@param param1 FlashObject
function arenaResult.onRematchShowTimerDone(param1) end

function arenaResult.startShowRematch() end

function arenaResult.onEventResize() end

---@param param1 number
function arenaResult.setAnchor(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function arenaResult.onEventDown(param1, param2, param3) end

---@param param1 number
function arenaResult.onEventUp(param1) end

---@param param1 boolean
---@param param2 number
function arenaResult.startScroll(param1, param2) end

function arenaResult.stopScroll() end

---@param param1 number
---@param param2 string
function arenaResult.setText(param1, param2) end

---@param param1 number
---@param param2 string
function arenaResult.setString(param1, param2) end

function arenaResult.clearList() end

---@param param1 number
---@param param2 boolean
function arenaResult.setCurrentPlayer(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 boolean
function arenaResult.addPlayer(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 number
function arenaResult.addTeam(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 number
function arenaResult.addHero(param1, param2, param3, param4, param5, param6, param7) end

function arenaResult.update() end

---@class UIRoot_book: FlashObject @book
---@field bookBg FlashObject
---@field buttonHint_mc FlashObject
---@field hit_mc FlashObject
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field s_ControllerfontSize number
---@field s_KeyboardfontSize number
---@field s_PageW number
---@field s_PageH number
---@field fontSize number
---@field pageFlip FlashObject
---@field closeBT FlashObject
---@field mc FlashObject
---@field buttonHints FlashObject
---@field startDragDiff number
---@field dragStartMP FlashObject
---@field windowDragStarted boolean
book = {}

function book.MainTimeline() end

function book.onEventInit() end

function book.setAnchor() end

---@param param1 FlashObject
function book.dragInv(param1) end

---@param param1 FlashObject
function book.dragInvMove(param1) end

---@param param1 FlashObject
function book.stopDragInv(param1) end

---@param param1 number
function book.onEventDown(param1) end

---@param param1 number
function book.onEventUp(param1) end

---@param param1 string
function book.addPage(param1) end

function book.setBookReady() end

---@param param1 boolean
function book.setControllerMode(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function book.addBtnHint(param1, param2, param3) end

function book.clearBtnHints() end

---@param param1 FlashObject
function book.flipPage(param1) end

---@param param1 FlashObject
function book.closeMe(param1) end

---@param param1 FlashObject
function book.onCatchMouse(param1) end

---@class UIRoot_bottomBar_c: FlashObject @bottomBar_c
---@field bottombar_mc FlashObject
---@field endTurnHint_mc FlashObject
---@field holdEndTurnHint_mc FlashObject
---@field cellWidth number
---@field cellHeight number
---@field charIconSize number
---@field cellSpacing number
---@field slotAmount number
---@field defaultHPColour number
---@field inActiveCombat boolean
---@field tweenTime number
---@field tweenTimeBounceBack number
---@field bbYActive number
---@field bbYInactive number
---@field bbYOverShoot number
---@field active boolean
---@field isInCombat boolean
---@field firstSlotX number
---@field apX number
---@field apY number
---@field hotBarX number
---@field hotBarY number
---@field label_array FlashArray
---@field showTurnTimer boolean
---@field isDragging boolean
---@field events FlashArray
---@field layout string
---@field characterHandle number
---@field portraitSize number
---@field downEventStr string
---@field slotWidth number
---@field slotUpdateList FlashArray
---@field slotUpdateDataList FlashArray
---@field btnList FlashArray
---@field endTurnHintEnabled boolean
---@field endTurnHintTw FlashObject
---@field tooltip_array FlashArray
---@field slotsEnabled boolean
---@field activateTimeLine FlashObject
---@field indicatorEnum FlashObject
---@field _sneaking boolean
---@field _unsheated boolean
---@field _tactical boolean
bottomBar_c = {}

function bottomBar_c.MainTimeline() end

---@param param1 boolean
function bottomBar_c.setActiveInCombat(param1) end

---@param param1 number
---@param param2 string
function bottomBar_c.setLabel(param1, param2) end

---@param param1 number
function bottomBar_c.setPlayerHandle(param1) end

---@param param1 number
function bottomBar_c.setCurrentHotbar(param1) end

---@param param1 number
function bottomBar_c.setSourcePoints(param1) end

---@param param1 number
function bottomBar_c.setMaxSourcePoints(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 boolean
function bottomBar_c.setCombatTurnNotification(param1, param2, param3, param4) end

---@param param1 number
function bottomBar_c.setTurnTimer(param1) end

---@param param1 number
function bottomBar_c.onEventUp(param1) end

---@param param1 number
function bottomBar_c.onEventDown(param1) end

function bottomBar_c.onEventInit() end

---@param param1 number
function bottomBar_c.setAnchor(param1) end

---@param param1 boolean
function bottomBar_c.setShared(param1) end

function bottomBar_c.showEndTurnHint() end

function bottomBar_c.hideEndTurnHint() end

function bottomBar_c.showEndTurnHint_INT() end

function bottomBar_c.showEndTurnHintDone() end

function bottomBar_c.hideEndTurnHint_INT() end

function bottomBar_c.hideEndTurnHintDone() end

function bottomBar_c.showHoldEndTurnHint() end

---@param param1 boolean
function bottomBar_c.hideHoldEndTurnHint(param1) end

function bottomBar_c.hideHoldEndTurnHintDone() end

function bottomBar_c.refreshSelection() end

function bottomBar_c.updateSlots() end

function bottomBar_c.updateSlotData() end

function bottomBar_c.next() end

function bottomBar_c.previous() end

---@param param1 string
function bottomBar_c.setBarInfo(param1) end

---@param param1 number
function bottomBar_c.selectSlot(param1) end

---@param param1 number
---@param param2 string
function bottomBar_c.setTooltipGroupLabel(param1, param2) end

function bottomBar_c.updateTooltip() end

function bottomBar_c.clearTooltip() end

---@param param1 number
---@param param2 number
function bottomBar_c.setSlotAmount(param1, param2) end

---@param param1 number
---@param param2 number
function bottomBar_c.setSlotCost(param1, param2) end

---@param param1 number
---@param param2 boolean
function bottomBar_c.setSlotPreviewEnabled(param1, param2) end

---@param param1 boolean
function bottomBar_c.setAllSlotsPreviewEnabled(param1) end

---@param param1 number
---@param param2 boolean
function bottomBar_c.setSlotEnabled(param1, param2) end

---@param param1 boolean
function bottomBar_c.setAllSlotsEnabled(param1) end

---@param param1 number
function bottomBar_c.showActiveSkill(param1) end

---@param param1 number
---@param param2 boolean
---@param param3 number
---@param param4 string
---@param param5 string
---@param param6 string
---@param param7 string
function bottomBar_c.setSlot(param1, param2, param3, param4, param5, param6, param7) end

function bottomBar_c.clearAll() end

---@param param1 number
---@param param2 number
---@param param3 boolean
function bottomBar_c.setSlotCoolDown(param1, param2, param3) end

function bottomBar_c.updateBtnInfos() end

---@param param1 number
---@param param2 string
function bottomBar_c.setBtnInfo(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 boolean
function bottomBar_c.setArmourBar(param1, param2, param3, param4) end

---@param param1 string
---@param param2 number
---@param param3 boolean
function bottomBar_c.setHealth(param1, param2, param3) end

function bottomBar_c.resetHPColour() end

---@param param1 number
function bottomBar_c.setHPColour(param1) end

---@param param1 number
---@param param2 boolean
function bottomBar_c.setExp(param1, param2) end

---@param param1 number
function bottomBar_c.setMaxAp(param1) end

---@param param1 number
function bottomBar_c.setActiveAp(param1) end

---@param param1 number
function bottomBar_c.setAvailableAp(param1) end

---@param param1 number
function bottomBar_c.setBonusAP(param1) end

---@param param1 number
function bottomBar_c.setGreyAP(param1) end

function bottomBar_c.animate2Active2() end

function bottomBar_c.animate2Deactive2() end

function bottomBar_c.animate2Deactive3() end

function bottomBar_c.activateBar() end

function bottomBar_c.activateAnimationDone() end

function bottomBar_c.deactivateBar() end

---@param param1 boolean
---@param param2 boolean
---@param param3 boolean
function bottomBar_c.setModeIndicator(param1, param2, param3) end

---@param param1 number
---@param param2 string
function bottomBar_c.setIndicatorLabel(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function bottomBar_c.getGlobalPositionOfMC(param1) end

---@param param1 FlashObject
---@param param2 number
---@return FlashObject
function bottomBar_c.changeColour(param1, param2) end

---@param param1 string
---@param param2 string
---@return boolean
function bottomBar_c.startsWith(param1, param2) end

---@class UIRoot_buttonLayout_c: FlashObject @buttonLayout_c
---@field close_txt FlashObject
---@field ps4_mc FlashObject
---@field title_txt FlashObject
---@field xbox_mc FlashObject
---@field events FlashArray
---@field layout string
---@field xBox boolean
---@field text_array FlashArray
---@field textFields_array FlashArray
---@field alignNone number
---@field alignCenterVertical number
---@field alignBottomVertical number
---@field alignment FlashArray
---@field autoSizes FlashArray
buttonLayout_c = {}

function buttonLayout_c.MainTimeline() end

function buttonLayout_c.onEventResize() end

---@param param1 number
function buttonLayout_c.onEventDown(param1) end

---@param param1 number
function buttonLayout_c.onEventUp(param1) end

function buttonLayout_c.onEventInit() end

---@param param1 boolean
function buttonLayout_c.setConsole(param1) end

function buttonLayout_c.updateButtonText() end

---@param param1 FlashObject
---@param param2 string
---@param param3 number
function buttonLayout_c.setText(param1, param2, param3) end

---@class UIRoot_calibrationScreen: FlashObject @calibrationScreen
---@field calibrationScreen_mc FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field itemsUpdateList FlashArray
---@field isDragging boolean
---@field inMultiSelect boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field controllerMode boolean
calibrationScreen = {}

function calibrationScreen.MainTimeline() end

function calibrationScreen.onEventInit() end

---@param param1 number
function calibrationScreen.onEventDown(param1) end

---@param param1 number
function calibrationScreen.onEventUp(param1) end

---@param param1 number
function calibrationScreen.setAnchor(param1) end

---@param param1 boolean
function calibrationScreen.setControllerMode(param1) end

---@param param1 string
function calibrationScreen.setText(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 number
function calibrationScreen.addSlider(param1, param2, param3, param4, param5) end

---@param param1 FlashObject
function calibrationScreen.onBtnPress(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function calibrationScreen.addBtnHint(param1, param2, param3, param4) end

---@class UIRoot_characterAssign: FlashObject @characterAssign
---@field assign_mc FlashObject
---@field characterPortraitWidth number
---@field characterPortraitHeight number
---@field userPortraitWidth number
---@field userPortraitHeight number
---@field isPartyLeader boolean
---@field isGameMaster boolean
---@field isServerHost boolean
---@field titleText string
---@field acceptText string
---@field alignmentColors FlashArray
---@field alignmentStrings FlashArray
---@field diplomacyText FlashArray
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field alignment string
---@field layout string
---@field characterReorder FlashArray
---@field characterSync FlashArray
---@field userSync FlashArray
---@field userUpdate FlashArray
characterAssign = {}

function characterAssign.MainTimeline() end

function characterAssign.onEventInit() end

---@param param1 number
---@param param2 number
function characterAssign.onEventResolution(param1, param2) end

function characterAssign.refresh() end

---@param param1 number
---@param param2 number
---@param param3 string
function characterAssign.addCharacter(param1, param2, param3) end

---@param param1 number
function characterAssign.removeCharacter(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function characterAssign.assignCharacter(param1, param2, param3) end

function characterAssign.reorderCharacters() end

function characterAssign.syncCharacters() end

---@param param1 number
---@param param2 number
---@param param3 string
function characterAssign.addUser(param1, param2, param3) end

---@param param1 number
function characterAssign.removeUser(param1) end

function characterAssign.syncUsers() end

---@param param1 boolean
---@param param2 boolean
function characterAssign.updateUsers(param1, param2) end

function characterAssign.debug() end

---@class UIRoot_characterAssign_c: FlashObject @characterAssign_c
---@field assign_mc FlashObject
---@field diplomacy_mc FlashObject
---@field buttonHintSize number
---@field characterSlotCount number
---@field characterPortraitWidth number
---@field characterPortraitHeight number
---@field userPortraitWidth number
---@field userPortraitHeight number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field isGameMaster boolean
---@field isPartyLeader boolean
---@field isServerHost boolean
---@field bottomBarHints FlashArray
---@field diplomacyBarHints FlashArray
---@field titleText string
---@field subtitleText string
---@field noActionsText string
---@field alignmentColors FlashArray
---@field alignmentStrings FlashArray
---@field diplomacyText FlashArray
---@field navigationText FlashArray
---@field state number
---@field states FlashArray
---@field alignment string
---@field layout string
---@field events FlashArray
---@field characterReorder FlashArray
---@field characterSync FlashArray
---@field userSync FlashArray
---@field userUpdate FlashArray
characterAssign_c = {}

function characterAssign_c.MainTimeline() end

function characterAssign_c.onEventInit() end

---@param param1 number
function characterAssign_c.onEventUp(param1) end

---@param param1 number
function characterAssign_c.onEventDown(param1) end

---@param param1 number
---@return boolean
function characterAssign_c.onEventUp_StateAssign(param1) end

---@param param1 number
---@return boolean
function characterAssign_c.onEventDown_StateAssign(param1) end

---@param param1 number
---@return boolean
function characterAssign_c.onEventUp_StateDiplomacy(param1) end

---@param param1 number
---@return boolean
function characterAssign_c.onEventDown_StateDiplomacy(param1) end

---@param param1 number
function characterAssign_c.setState(param1) end

---@param param1 number
function characterAssign_c.setAnchor(param1) end

function characterAssign_c.refresh() end

---@param param1 number
---@param param2 number
---@param param3 string
function characterAssign_c.addCharacter(param1, param2, param3) end

---@param param1 number
function characterAssign_c.removeCharacter(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function characterAssign_c.assignCharacter(param1, param2, param3) end

function characterAssign_c.reorderCharacters() end

function characterAssign_c.syncCharacters() end

---@param param1 number
---@param param2 number
---@param param3 string
function characterAssign_c.addUser(param1, param2, param3) end

---@param param1 number
function characterAssign_c.removeUser(param1) end

function characterAssign_c.syncUsers() end

---@param param1 boolean
---@param param2 boolean
function characterAssign_c.updateUsers(param1, param2) end

function characterAssign_c.debug() end

---@class UIRoot_characterCreation: FlashObject @characterCreation
---@field CCPanel_mc FlashObject
---@field back_mc FlashObject
---@field dragHit_mc FlashObject
---@field header_mc FlashObject
---@field letterB_mc FlashObject
---@field letterT_mc FlashObject
---@field portraits_mc FlashObject
---@field start_mc FlashObject
---@field events FlashArray
---@field userIconHeight number
---@field userIconWidth number
---@field charIconHeight number
---@field charIconWidth number
---@field designResolution FlashObject
---@field fixedContentSize FlashObject
---@field iconSize number
---@field iconSpacing number
---@field maxNameChars number
---@field numberOfClassEdits number
---@field skillIconSize number
---@field chosenListSpacing number
---@field listSpacing number
---@field iconSpacingH number
---@field iconSpacingV number
---@field numberOfCols number
---@field chosenListCols number
---@field chosenListIconSize number
---@field chosenListSpacingH number
---@field chosenListSpacingV number
---@field PositionForTutorialX number
---@field PositionForTutorialY number
---@field numberOfSlots number
---@field availableAttributePoints number
---@field availableTalentPoints number
---@field availableTagPoints number
---@field availableAbilityPoints number
---@field availableCivilPoints number
---@field availableSkillPoints number
---@field attributeCap number
---@field combatAbilityCap number
---@field cibilAbilityCap number
---@field layout string
---@field alignment string
---@field uiScaling number
---@field isDragging boolean
---@field characterHandle number
---@field isGM boolean
---@field isMaster boolean
---@field screenWidth number
---@field screenHeight number
---@field contentArray FlashArray
---@field stepArray FlashArray
---@field attributeArray FlashArray
---@field abilityArray FlashArray
---@field skillArray FlashArray
---@field skillSchoolString FlashArray
---@field talentArray FlashArray
---@field racialTalentArray FlashArray
---@field tagArray FlashArray
---@field racialTagArray FlashArray
---@field chosenSkills FlashArray
---@field racialSkills FlashArray
---@field panelTitles FlashArray
---@field playerArray FlashArray
---@field currentPanel number
---@field createOrigin boolean
---@field isFinished boolean
---@field creationType number
---@field textArray FlashArray
---@field enableOrigin boolean
characterCreation = {}

function characterCreation.MainTimeline() end

---@param param1 FlashObject
function characterCreation.onOverScrollEat(param1) end

---@param param1 FlashObject
function characterCreation.onOutScrollEat(param1) end

function characterCreation.onEventInit() end

function characterCreation.closeOriginPreview() end

function characterCreation.onStartButton() end

---@param param1 number
---@param param2 number
function characterCreation.onEventResolution(param1, param2) end

---@param param1 string
function characterCreation.setLetterBoxText(param1) end

---@param param1 boolean
function characterCreation.setLetterBoxVisibility(param1) end

---@param param1 number
---@param param2 number
function characterCreation.onEventUp(param1, param2) end

---@param param1 number
---@param param2 number
function characterCreation.onEventDown(param1, param2) end

---@param param1 number
---@param param2 number
function characterCreation.setPanel(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function characterCreation.selectOption(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 boolean
function characterCreation.setText(param1, param2, param3) end

---@param param1 number
function characterCreation.setArmourState(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function characterCreation.setInstrumentName(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
function characterCreation.setDetails(param1, param2) end

---@param param1 boolean
function characterCreation.enableStoryPlayback(param1) end

function characterCreation.updateSteps() end

---@param param1 number
---@param param2 string
function characterCreation.setStepLabel(param1, param2) end

function characterCreation.updateContent() end

function characterCreation.updateSkills() end

function characterCreation.updateAttributes() end

function characterCreation.updateAbilities() end

function characterCreation.updateTalents() end

function characterCreation.updateTags() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function characterCreation.setTextField(param1, param2, param3) end

---@param param1 number
---@param param2 string
function characterCreation.setClassEditTabLabel(param1, param2) end

---@param param1 string
function characterCreation.setGM(param1) end

---@param param1 boolean
---@param param2 string
function characterCreation.setBackButtonVisible(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 boolean
function characterCreation.creationDone(param1, param2, param3) end

---@param param1 number
function characterCreation.setInstrument(param1) end

---@param param1 number
function characterCreation.clearPanelSelectors(param1) end

---@param param1 number
---@param param2 number
function characterCreation.setFreeClassPoints(param1, param2) end

---@param param1 FlashObject
function characterCreation.onDragDown(param1) end

---@param param1 number
function characterCreation.setAvailableSkillSlots(param1) end

function characterCreation.updatePortraits() end

---@class UIRoot_characterCreation_c: FlashObject @characterCreation_c
---@field CCPanel_mc FlashObject
---@field btnHints_mc FlashObject
---@field header_mc FlashObject
---@field letterB_mc FlashObject
---@field letterT_mc FlashObject
---@field portraits_mc FlashObject
---@field tooltipHolder_mc FlashObject
---@field waiting_mc FlashObject
---@field canShowTooltip boolean
---@field tooltipVisible boolean
---@field btnHintSize number
---@field charIconHeight number
---@field charIconWidth number
---@field userIconHeight number
---@field userIconWidth number
---@field designResolution FlashObject
---@field zeroXpoint number
---@field fixedContentSize FlashObject
---@field iconSize number
---@field iconSpacing number
---@field maxNameChars number
---@field numberOfClassEdits number
---@field numberOfInstruments number
---@field chosenListCols number
---@field chosenListIconSize number
---@field chosenListSpacingH number
---@field chosenListSpacingV number
---@field dFont number
---@field hFont number
---@field alteredFont number
---@field dFont2 number
---@field hFont2 number
---@field tutorialBoxLeftX number
---@field tutorialBoxLeftY number
---@field tutorialBoxRightX number
---@field tutorialBoxRightY number
---@field tutorialBoxSPX number
---@field tutorialBoxSPY number
---@field availableAttributePoints number
---@field availableTalentPoints number
---@field availableTagPoints number
---@field availableAbilityPoints number
---@field availableCivilPoints number
---@field availableSkillPoints number
---@field chosenInstrumentPrefix string
---@field attributeCap number
---@field combatAbilityCap number
---@field cibilAbilityCap number
---@field events FlashArray
---@field layout string
---@field alignment string
---@field uiScaling number
---@field screenWidth number
---@field screenHeight number
---@field buttonHints FlashArray
---@field contentArray FlashArray
---@field stepArray FlashArray
---@field attributeArray FlashArray
---@field abilityArray FlashArray
---@field skillArray FlashArray
---@field talentArray FlashArray
---@field racialTalentArray FlashArray
---@field tagArray FlashArray
---@field racialTagArray FlashArray
---@field tooltipArray FlashArray
---@field playerArray FlashArray
---@field isMaster boolean
---@field isOrigin boolean
---@field currentPanel number
---@field tooltipMC FlashObject
---@field g_playerId number
---@field g_playerAmount number
---@field g_isLeft boolean
---@field shiftUI boolean
---@field hackOffset number
---@field enableOrigin boolean
---@field eatup boolean
characterCreation_c = {}

function characterCreation_c.MainTimeline() end

function characterCreation_c.onEventInit() end

function characterCreation_c.updatePortraits() end

---@param param1 number
---@param param2 boolean
function characterCreation_c.setVoiceChatVisibility(param1, param2) end

---@param param1 number
---@return FlashObject
function characterCreation_c.setSaturation(param1) end

---@param param1 number
function characterCreation_c.setArmourState(param1) end

---@param param1 string
function characterCreation_c.setLetterBoxText(param1) end

---@param param1 boolean
---@param param2 boolean
function characterCreation_c.setLetterBoxVisibility(param1, param2) end

---@param param1 number
function characterCreation_c.setAnchor(param1) end

---@param param1 number
function characterCreation_c.setAmountOfPlayers(param1) end

function characterCreation_c.INTSetPanelPos() end

function characterCreation_c.setTooltipPos() end

---@param param1 string
function characterCreation_c.setGM(param1) end

---@param param1 number
function characterCreation_c.setInstrument(param1) end

---@param param1 number
---@param param2 string
function characterCreation_c.setInstrumentName(param1, param2) end

---@param param1 string
---@param param2 boolean
---@param param3 boolean
function characterCreation_c.creationDone(param1, param2, param3) end

function characterCreation_c.showTooltip() end

function characterCreation_c.clearTooltip() end

function characterCreation_c.hideTooltip() end

---@param param1 number
---@param param2 boolean
function characterCreation_c.setDetails(param1, param2) end

---@param param1 boolean
function characterCreation_c.enableStoryPlayback(param1) end

---@param param1 number
---@param param2 number
function characterCreation_c.onEventResolution(param1, param2) end

---@param param1 number
---@param param2 number
function characterCreation_c.onEventDown(param1, param2) end

---@param param1 number
---@param param2 number
function characterCreation_c.onEventUp(param1, param2) end

function characterCreation_c.toggleShowTooltip() end

---@param param1 number
---@param param2 number
function characterCreation_c.setPanel(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function characterCreation_c.selectOption(param1, param2, param3) end

function characterCreation_c.setBtnHints() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function characterCreation_c.setText(param1, param2, param3) end

---@param param1 boolean
function characterCreation_c.headerBtnHintsVisible(param1) end

function characterCreation_c.updateSteps() end

---@param param1 number
---@param param2 string
function characterCreation_c.setStepLabel(param1, param2) end

function characterCreation_c.updateContent() end

function characterCreation_c.updateSkills() end

function characterCreation_c.updateAttributes() end

function characterCreation_c.updateAbilities() end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 string
---@param param5 number
---@param param6 number
---@param param7 boolean
function characterCreation_c.addAbility(param1, param2, param3, param4, param5, param6, param7) end

function characterCreation_c.updateTalents() end

function characterCreation_c.updateTags() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function characterCreation_c.setTextField(param1, param2, param3) end

---@param param1 number
---@param param2 string
function characterCreation_c.setClassEditTabLabel(param1, param2) end

---@param param1 number
function characterCreation_c.clearPanelSelectors(param1) end

---@param param1 number
---@param param2 number
function characterCreation_c.setFreeClassPoints(param1, param2) end

---@param param1 number
function characterCreation_c.setAvailableSkillSlots(param1) end

---@class UIRoot_characterSheet: FlashObject @characterSheet
---@field stats_mc FlashObject
---@field charHandle number
---@field initDone boolean
---@field events FlashArray
---@field layout string
---@field alignment string
---@field curTooltip number
---@field hasTooltip boolean
---@field availableStr string
---@field uiLeft number
---@field uiRight number
---@field uiTop number
---@field uiMinHeight number
---@field uiMinWidth number
---@field charList_array FlashArray
---@field charListPartyPosX number
---@field charListOnePlayerPosX number
---@field playerIconW number
---@field playerIconH number
---@field invRows number
---@field invCols number
---@field invCellSize number
---@field invCellSpacing number
---@field skillList FlashArray
---@field skillIconSize number
---@field skillCols number
---@field spacingV number
---@field spacingH number
---@field listSpacing number
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field leftPanelW number
---@field tabsTexts FlashArray
---@field primStat_array FlashArray
---@field secStat_array FlashArray
---@field ability_array FlashArray
---@field tags_array FlashArray
---@field talent_array FlashArray
---@field visual_array FlashArray
---@field visualValues_array FlashArray
---@field customStats_array FlashArray
---@field lvlBtnAbility_array FlashArray
---@field lvlBtnStat_array FlashArray
---@field lvlBtnSecStat_array FlashArray
---@field lvlBtnTalent_array FlashArray
---@field allignmentArray FlashArray
---@field aiArray FlashArray
---@field inventoryUpdateList FlashArray
---@field isGameMasterChar boolean
---@field EQContainer FlashObject
---@field slotAmount number
---@field cellSize number
---@field slot_array FlashArray
---@field itemsUpdateList FlashArray
---@field renameBtnTooltip string
---@field alignmentTooltip string
---@field aiTooltip string
---@field createNewStatBtnLabel string
---@field isDragging boolean
---@field draggingSkill boolean
---@field tabState number
---@field screenWidth number
---@field screenHeight number
---@field text_array FlashArray
---@field maxIndexInView number
---@field strUndefined string
---@field strSelectTreasure string
---@field strGenerate string
---@field strClear string
---@field strLevel string
---@field listRarity FlashArray
---@field listTreasures FlashArray
---@field generateTreasureRarityId number
---@field generateTreasureId number
---@field generateTreasureLevel number
characterSheet = {}

function characterSheet.MainTimeline() end

function characterSheet.onEventResize() end

function characterSheet.updateVisuals() end

function characterSheet.updateSkills() end

function characterSheet.GMShowTargetSkills() end

function characterSheet.resetSkillDragging() end

function characterSheet.updateInventory() end

function characterSheet.updateAllignmentList() end

---@param param1 number
function characterSheet.selectAllignment(param1) end

function characterSheet.updateAIList() end

---@param param1 number
function characterSheet.selectAI(param1) end

---@param param1 boolean
---@param param2 boolean
---@param param3 boolean
function characterSheet.setGameMasterMode(param1, param2, param3) end

---@param param1 number
function characterSheet.onEventUp(param1) end

---@param param1 number
function characterSheet.onEventDown(param1) end

---@param param1 number
---@param param2 number
function characterSheet.onEventResolution(param1, param2) end

function characterSheet.onEventInit() end

---@param param1 boolean
function characterSheet.setPossessedState(param1) end

---@param param1 FlashObject
---@return FlashObject
function characterSheet.getGlobalPositionOfMC(param1) end

---@param param1 FlashObject
---@param param2 string
function characterSheet.showTooltipForMC(param1, param2) end

---@param param1 boolean
function characterSheet.setActionsDisabled(param1) end

function characterSheet.updateItems() end

---@param param1 number
function characterSheet.setHelmetOptionState(param1) end

---@param param1 string
function characterSheet.setHelmetOptionTooltip(param1) end

---@param param1 string
function characterSheet.setPlayerInfo(param1) end

---@param param1 string
function characterSheet.setAvailableLabels(param1) end

---@param param1 FlashObject
function characterSheet.pointsTextfieldChanged(param1) end

---@param param1 number
function characterSheet.selectCharacter(param1) end

---@param param1 number
---@param param2 string
function characterSheet.setText(param1, param2) end

---@param param1 string
function characterSheet.setTitle(param1) end

---@param param1 string
---@param param2 string
---@param param3 boolean
function characterSheet.addText(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 number
function characterSheet.addPrimaryStat(param1, param2, param3, param4) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 number
---@param param5 number
---@param param6 number
function characterSheet.addSecondaryStat(param1, param2, param3, param4, param5, param6) end

function characterSheet.clearSecondaryStats() end

---@param param1 boolean
---@param param2 number
---@param param3 string
function characterSheet.addAbilityGroup(param1, param2, param3) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 string
---@param param6 string
---@param param7 string
function characterSheet.addAbility(param1, param2, param3, param4, param5, param6, param7) end

---@param param1 string
---@param param2 number
---@param param3 number
function characterSheet.addTalent(param1, param2, param3) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
function characterSheet.addTag(param1, param2, param3, param4) end

---@param param1 string
---@param param2 number
function characterSheet.addVisual(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function characterSheet.addVisualOption(param1, param2, param3) end

function characterSheet.updateCharList() end

---@param param1 boolean
function characterSheet.cycleCharList(param1) end

function characterSheet.updateArraySystem() end

---@param param1 number
---@param param2 boolean
function characterSheet.setStatPlusVisible(param1, param2) end

---@param param1 number
---@param param2 boolean
function characterSheet.setStatMinusVisible(param1, param2) end

---@param param1 number
---@param param2 boolean
---@param param3 boolean
---@param param4 boolean
---@param param5 number
---@return FlashObject
function characterSheet.setupSecondaryStatsButtons(param1, param2, param3, param4, param5) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 boolean
function characterSheet.setAbilityPlusVisible(param1, param2, param3, param4) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 boolean
function characterSheet.setAbilityMinusVisible(param1, param2, param3, param4) end

---@param param1 number
---@param param2 boolean
function characterSheet.setTalentPlusVisible(param1, param2) end

---@param param1 number
---@param param2 boolean
function characterSheet.setTalentMinusVisible(param1, param2) end

---@param param1 string
function characterSheet.addTitle(param1) end

function characterSheet.hideLevelUpStatButtons() end

function characterSheet.hideLevelUpAbilityButtons() end

function characterSheet.hideLevelUpTalentButtons() end

function characterSheet.clearStats() end

function characterSheet.clearTags() end

function characterSheet.clearTalents() end

function characterSheet.clearAbilities() end

---@param param1 number
---@param param2 string
function characterSheet.setPanelTitle(param1, param2) end

---@param param1 boolean
function characterSheet.showAcceptStatsAcceptButton(param1) end

---@param param1 boolean
function characterSheet.showAcceptAbilitiesAcceptButton(param1) end

---@param param1 boolean
function characterSheet.showAcceptTalentAcceptButton(param1) end

---@param param1 number
function characterSheet.setAvailableStatPoints(param1) end

---@param param1 number
function characterSheet.setAvailableCombatAbilityPoints(param1) end

---@param param1 number
function characterSheet.setAvailableCivilAbilityPoints(param1) end

---@param param1 number
function characterSheet.setAvailableTalentPoints(param1) end

---@param param1 number
---@param param2 number
function characterSheet.addSpacing(param1, param2) end

---@param param1 string
---@param param2 string
function characterSheet.addGoldWeight(param1, param2) end

---@param param1 string
---@param param2 string
---@return boolean
function characterSheet.startsWith(param1, param2) end

---@param param1 number
---@param param2 number
function characterSheet.ShowItemUnEquipAnim(param1, param2) end

---@param param1 number
---@param param2 number
function characterSheet.ShowItemEquipAnim(param1, param2) end

---@return FlashObject
function characterSheet.setupStrings() end

---@return FlashObject
function characterSheet.setupRarity() end

---@return FlashObject
function characterSheet.setupTreasures() end

---@param param1 FlashObject
---@return FlashObject
function characterSheet.onOpenDropList(param1) end

---@return FlashObject
function characterSheet.closeDropLists() end

---@param param1 number
---@return FlashObject
function characterSheet.setGenerationRarity(param1) end

---@param param1 number
---@return FlashObject
function characterSheet.onSelectGenerationRarity(param1) end

---@param param1 number
---@return FlashObject
function characterSheet.onChangeGenerationLevel(param1) end

---@param param1 number
---@return FlashObject
function characterSheet.onSelectTreasure(param1) end

---@return FlashObject
function characterSheet.onBtnGenerateStock() end

---@return FlashObject
function characterSheet.onBtnClearInventory() end

---@class UIRoot_chatLog: FlashObject @chatLog
---@field log_mc FlashObject
---@field events FlashArray
---@field layout string
---@field isUIMoving boolean
---@field tooltip_array FlashArray
chatLog = {}

function chatLog.MainTimeline() end

function chatLog.onEventResize() end

function chatLog.onEventInit() end

---@param param1 number
function chatLog.onEventUp(param1) end

---@param param1 number
function chatLog.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function chatLog.startsWith(param1, param2) end

---@param param1 number
function chatLog.setMaxInputlength(param1) end

---@param param1 boolean
function chatLog.enableGlobalChat(param1) end

---@param param1 number
function chatLog.clearTab(param1) end

---@param param1 number
function chatLog.selectTab(param1) end

---@param param1 number
function chatLog.removeTab(param1) end

function chatLog.removeTabs() end

---@param param1 number
---@param param2 string
function chatLog.addTab(param1, param2) end

---@param param1 number
---@param param2 string
function chatLog.addTextToTab(param1, param2) end

---@param param1 number
---@param param2 boolean
function chatLog.tabInput(param1, param2) end

---@param param1 boolean
function chatLog.enableInput(param1) end

function chatLog.reOpen() end

---@param param1 boolean
function chatLog.setLogVisible(param1) end

---@param param1 string
function chatLog.setSendBtnTooltip(param1) end

---@param param1 number
---@param param2 number
function chatLog.setLogSize(param1, param2) end

---@param param1 boolean
function chatLog.setLockInput(param1) end

---@param param1 boolean
function chatLog.setFocusOnInput(param1) end

---@param param1 boolean
function chatLog.setGlobalBtnDisabled(param1) end

---@param param1 boolean
function chatLog.setBGVisibility(param1) end

---@param param1 number
---@param param2 string
function chatLog.setTooltip(param1, param2) end

---@class UIRoot_combatLog: FlashObject @combatLog
---@field log_mc FlashObject
---@field events FlashArray
---@field layout string
---@field isUIMoving boolean
---@field tooltip_array FlashArray
combatLog = {}

function combatLog.MainTimeline() end

function combatLog.onEventResize() end

---@param param1 number
---@param param2 number
function combatLog.onEventResolution(param1, param2) end

---@param param1 number
function combatLog.onEventUp(param1) end

function combatLog.onEventInit() end

---@param param1 number
function combatLog.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function combatLog.startsWith(param1, param2) end

function combatLog.clearAll() end

function combatLog.clearAllTexts() end

---@param param1 number
function combatLog.clearTab(param1) end

---@param param1 number
function combatLog.clearFilter(param1) end

---@param param1 number
function combatLog.selectFilter(param1) end

---@param param1 number
---@param param2 boolean
function combatLog.setFilterSelection(param1, param2) end

---@param param1 string
function combatLog.addTab(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function combatLog.addFilter(param1, param2, param3) end

---@param param1 number
---@param param2 string
function combatLog.addTextToTab(param1, param2) end

---@param param1 number
---@param param2 string
function combatLog.addTextToFilter(param1, param2) end

function combatLog.reOpen() end

---@param param1 boolean
function combatLog.setLogVisible(param1) end

---@param param1 number
---@param param2 number
function combatLog.setLogSize(param1, param2) end

function combatLog.requestSize() end

---@param param1 boolean
function combatLog.setLockInput(param1) end

---@param param1 boolean
function combatLog.setBGVisibility(param1) end

---@param param1 number
---@param param2 string
function combatLog.setTooltip(param1, param2) end

---@class UIRoot_combatLog_c: FlashObject @combatLog_c
---@field log_mc FlashObject
---@field events FlashArray
---@field layout string
combatLog_c = {}

function combatLog_c.MainTimeline() end

---@param param1 number
function combatLog_c.onEventUp(param1) end

function combatLog_c.onEventInit() end

function combatLog_c.SetPositionBottomRight() end

function combatLog_c.SetPositionBottomLeft() end

---@param param1 number
function combatLog_c.setAnchor(param1) end

---@param param1 number
function combatLog_c.onEventDown(param1) end

---@param param1 number
function combatLog_c.setFadeOutDelay(param1) end

function combatLog_c.clearAll() end

---@param param1 string
---@param param2 boolean
function combatLog_c.addTextEntry(param1, param2) end

---@param param1 boolean
function combatLog_c.setLogVisible(param1) end

---@class UIRoot_combatTurn: FlashObject @combatTurn
---@field cbt_mc FlashObject
---@field iconHeight number
---@field iconWidth number
---@field events FlashArray
---@field barUpdate FlashArray
---@field alignmentUpdate FlashArray
---@field layout string
---@field isControllerMode boolean
---@field currentTurn_Array FlashArray
---@field nextTurn_Array FlashArray
---@field guardBuffer FlashArray
---@field initiativeBuffer FlashArray
---@field showtimeLine FlashObject
---@field moveCurrentTL FlashObject
---@field defaultHPColour number
---@field defaultABColour number
---@field defaultMABColour number
---@field hadInit boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field smallIconScale number
---@field activeCharHolder FlashObject
---@field charHolderWidth number
---@field sharedUI boolean
---@field leftUI boolean
---@field charId number
---@field holderXPos number
---@field holderXPosL number
---@field holderXPosR number
---@field characterWidthOverwrite number
---@field list FlashObject
---@field nextRoundList FlashObject
---@field scrollSel number
---@field scrollVisAm number
---@field requestActiveCharId number
---@field cbtStartX number
---@field screenWidth number
---@field combatTurnPointerX number
---@field combatTurnPointerY number
---@field activeChar FlashObject
---@field seperatorTween FlashObject
---@field nextRoundListTween FlashObject
---@field tweenTime number
---@field halfWidth number
---@field extraSepW number
---@field charDiesTimer FlashObject
---@field whiteCol number
---@field moveInOrder_array FlashArray
---@field moveInOrderMC FlashObject
---@field moveGuardMC FlashObject
---@field MIO_array FlashArray
---@field isGuardingBool boolean
---@field moveTweenTime number
---@field twShow FlashObject
combatTurn = {}

function combatTurn.MainTimeline() end

---@return number
function combatTurn.scrollTotalW() end

---@param param1 number
function combatTurn.setDefaultHPColour(param1) end

function combatTurn.onEventResize() end

---@param param1 number
function combatTurn.onEventUp(param1) end

---@param param1 FlashObject
function combatTurn.fixPositionFunc(param1) end

function combatTurn.fixPosition() end

function combatTurn.onEventInit() end

---@param param1 number
function combatTurn.setAnchor(param1) end

---@param param1 boolean
function combatTurn.setShared(param1) end

function combatTurn.setHolderPos() end

---@param param1 number
function combatTurn.onEventDown(param1) end

---@param param1 FlashObject
function combatTurn.showTooltip(param1) end

---@param param1 FlashObject
---@return FlashObject
function combatTurn.getGlobalPositionOfMC(param1) end

function combatTurn.updateTurnList() end

---@param param1 FlashObject
function combatTurn.onListMoveStop(param1) end

---@param param1 FlashObject
---@param param2 FlashArray
function combatTurn.INTUpdateCharList(param1, param2) end

function combatTurn.updateTeams() end

---@param param1 FlashObject
function combatTurn.INTRemoveObsoleteMCs(param1) end

function combatTurn.INTUpdateListPositions() end

---@param param1 number
---@param param2 number
function combatTurn.select(param1, param2) end

---@param param1 FlashObject
---@param param2 number
function combatTurn.INTSetSelection(param1, param2) end

function combatTurn.clearSelection() end

function combatTurn.startRound() end

function combatTurn.scrollLeft() end

function combatTurn.scrollRight() end

---@param param1 FlashObject
---@param param2 number
---@return FlashObject
function combatTurn.getBarByType(param1, param2) end

---@param param1 FlashObject
---@param param2 number
---@param param3 number
function combatTurn.setBarValueByType(param1, param2, param3) end

---@param param1 number
---@param param2 number
function combatTurn.setAlignment(param1, param2) end

---@param param1 FlashObject
---@param param2 number
function combatTurn.INTSetAlignment(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
function combatTurn.setBarPercentage(param1, param2, param3) end

---@param param1 FlashObject
---@param param2 number
---@param param3 number
function combatTurn.INTSetBar(param1, param2, param3) end

---@param param1 FlashObject
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 number
---@param param6 number
---@param param7 number
---@param param8 number
---@param param9 number
---@param param10 number
---@param param11 FlashObject
---@return FlashObject
function combatTurn.addChar(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) end

---@param param1 FlashObject
---@param param2 string
function combatTurn.setIggyImage(param1, param2) end

---@param param1 FlashObject
---@param param2 string
function combatTurn.addIggyIcon(param1, param2) end

---@param param1 FlashObject
function combatTurn.removeDead(param1) end

---@param param1 number
function combatTurn.characterDies(param1) end

---@param param1 number
---@return number
function combatTurn.getCharTypeColour(param1) end

---@param param1 FlashObject
function combatTurn.copyCharToActiveHolder(param1) end

---@param param1 number
function combatTurn.setActiveCharacter(param1) end

function combatTurn.displayActiveChar() end

---@param param1 FlashObject
function combatTurn.onCharHolderFadedOutAndDestroy(param1) end

---@param param1 boolean
function combatTurn.setAllowMouseClicking(param1) end

function combatTurn.popTop() end

---@param param1 number
function combatTurn.cleanupActive(param1) end

function combatTurn.popToBottom() end

function combatTurn.clearGuardAnim() end

---@param param1 number
---@param param2 number
function combatTurn.setGuardingCharacter(param1, param2) end

function combatTurn.INTShowNextGuardingCharacter() end

function combatTurn.OnGuardAnimationsFinished() end

function combatTurn.UpdateInitiatives() end

function combatTurn.INTShowNextInitiativeAnimation() end

function combatTurn.INTRequestSetActiveChar() end

function combatTurn.MIOMoveNext() end

function combatTurn.cleanupMoveInOrder() end

---@param param1 number
---@param param2 number
function combatTurn.moveInOrder(param1, param2) end

---@param param1 FlashObject
function combatTurn.MIOMoveDown(param1) end

---@param param1 FlashObject
function combatTurn.MIOMoveX(param1) end

---@param param1 FlashObject
function combatTurn.MIODoneMovingX(param1) end

---@param param1 FlashObject
function combatTurn.GuardMIOListReorderDone(param1) end

---@param param1 FlashObject
function combatTurn.MIOListReorderDone(param1) end

function combatTurn.clearMoveInOrder() end

---@param param1 number
---@param param2 number
---@param param3 FlashObject
function combatTurn.moveInOrderNoAnim(param1, param2, param3) end

function combatTurn.refreshList() end

function combatTurn.INTrefreshList() end

---@param param1 string
---@param param2 string
---@return boolean
function combatTurn.startsWith(param1, param2) end

function combatTurn.clearAll() end

function combatTurn.resetAnchor() end

function combatTurn.hideCbt() end

function combatTurn.showCbt() end

---@param param1 FlashObject
---@return FlashObject
function combatTurn.removeChildrenOf(param1) end

---@class UIRoot_connectionMenu: FlashObject @connectionMenu
---@field popup_mc FlashObject
---@field CloseTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field connectionOptionsLabel string
---@field iconWidth number
---@field iconHeight number
---@field hasTooltip boolean
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
connectionMenu = {}

function connectionMenu.MainTimeline() end

function connectionMenu.onEventResize() end

---@param param1 number
---@return boolean
function connectionMenu.onEventUp(param1) end

function connectionMenu.onEventInit() end

---@param param1 number
---@return boolean
function connectionMenu.onEventDown(param1) end

---@return FlashObject
function connectionMenu.hideWin() end

---@return FlashObject
function connectionMenu.showWin() end

---@return number
function connectionMenu.getHeight() end

---@return number
function connectionMenu.getWidth() end

---@param param1 number
---@return FlashObject
function connectionMenu.setX(param1) end

---@param param1 number
---@return FlashObject
function connectionMenu.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function connectionMenu.setPos(param1, param2) end

---@return number
function connectionMenu.getX() end

---@return number
function connectionMenu.getY() end

function connectionMenu.showPopUp() end

function connectionMenu.hidePopUp() end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 string
---@param param5 boolean
function connectionMenu.addState(param1, param2, param3, param4, param5) end

---@param param1 boolean
---@param param2 boolean
---@param param3 boolean
function connectionMenu.setDisabledStates(param1, param2, param3) end

---@param param1 number
---@param param2 string
function connectionMenu.setInfoTooltip(param1, param2) end

---@param param1 number
---@param param2 boolean
function connectionMenu.setInfoVisible(param1, param2) end

function connectionMenu.fadeIn() end

function connectionMenu.fadeOut() end

---@param param1 number
---@param param2 boolean
function connectionMenu.setCheckBoxVisible(param1, param2) end

---@param param1 number
---@param param2 string
function connectionMenu.setCheckBoxText(param1, param2) end

---@param param1 number
---@param param2 string
function connectionMenu.setCheckBoxTooltip(param1, param2) end

---@param param1 number
---@param param2 number
function connectionMenu.setCheckBoxState(param1, param2) end

---@param param1 boolean
function connectionMenu.setCopyBtnVisible(param1) end

---@param param1 boolean
function connectionMenu.setCopyBtnDisabled(param1) end

---@param param1 string
function connectionMenu.setCopyBtnTooltip(param1) end

---@param param1 string
function connectionMenu.setPeerKickTooltip(param1) end

---@param param1 number
---@param param2 string
function connectionMenu.setText(param1, param2) end

function connectionMenu.clearPeerBtns() end

---@param param1 number
function connectionMenu.setPeerBtnsAmount(param1) end

---@param param1 number
function connectionMenu.selectState(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function connectionMenu.addPlayerOnPeerSlot(param1, param2, param3) end

---@param param1 number
function connectionMenu.removePlayerFromPeerSlot(param1) end

---@class UIRoot_connectivity_c: FlashObject @connectivity_c
---@field btnContainer_mc FlashObject
---@field popup_mc FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field hasTooltip boolean
---@field iconWidth number
---@field iconHeight number
---@field downStr string
connectivity_c = {}

function connectivity_c.MainTimeline() end

function connectivity_c.onEventResize() end

function connectivity_c.onEventInit() end

---@param param1 number
function connectivity_c.onEventUp(param1) end

---@param param1 number
function connectivity_c.onEventDown(param1) end

---@return FlashObject
function connectivity_c.hideWin() end

---@return FlashObject
function connectivity_c.showWin() end

---@return number
function connectivity_c.getHeight() end

---@return number
function connectivity_c.getWidth() end

---@param param1 number
---@return FlashObject
function connectivity_c.setX(param1) end

---@param param1 number
---@return FlashObject
function connectivity_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function connectivity_c.setPos(param1, param2) end

---@return number
function connectivity_c.getX() end

---@return number
function connectivity_c.getY() end

function connectivity_c.showPopUp() end

function connectivity_c.hidePopUp() end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 string
---@param param5 boolean
function connectivity_c.addState(param1, param2, param3, param4, param5) end

---@param param1 boolean
---@param param2 boolean
---@param param3 boolean
function connectivity_c.setDisabledStates(param1, param2, param3) end

---@param param1 number
---@param param2 string
function connectivity_c.setInfoTooltip(param1, param2) end

---@param param1 number
---@param param2 boolean
function connectivity_c.setInfoVisible(param1, param2) end

function connectivity_c.fadeIn() end

function connectivity_c.fadeOut() end

---@param param1 number
---@param param2 boolean
function connectivity_c.setCheckBoxVisible(param1, param2) end

---@param param1 number
---@param param2 string
function connectivity_c.setCheckBoxText(param1, param2) end

---@param param1 number
---@param param2 string
function connectivity_c.setCheckBoxTooltip(param1, param2) end

---@param param1 number
---@param param2 number
function connectivity_c.setCheckBoxState(param1, param2) end

---@param param1 string
function connectivity_c.addCheckBoxOptions(param1) end

---@param param1 boolean
function connectivity_c.setCopyBtnVisible(param1) end

---@param param1 boolean
function connectivity_c.setCopyBtnDisabled(param1) end

---@param param1 string
function connectivity_c.setCopyBtnTooltip(param1) end

---@param param1 string
function connectivity_c.setPeerKickTooltip(param1) end

---@param param1 boolean
function connectivity_c.enableExtraOptions(param1) end

---@param param1 number
---@param param2 string
function connectivity_c.setText(param1, param2) end

function connectivity_c.clearPeerBtns() end

---@param param1 number
function connectivity_c.setPeerBtnsAmount(param1) end

---@param param1 number
function connectivity_c.selectState(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function connectivity_c.addPlayerOnPeerSlot(param1, param2, param3) end

---@param param1 number
function connectivity_c.removePlayerFromPeerSlot(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function connectivity_c.addBtnHint(param1, param2, param3) end

function connectivity_c.clearBtnHints() end

---@param param1 number
---@param param2 string
---@param param3 number
function connectivity_c.addExtraPanelBtnHint(param1, param2, param3) end

function connectivity_c.clearExtraPanelBtnHints() end

---@param param1 number
---@param param2 string
---@param param3 number
function connectivity_c.addFriendBtnHint(param1, param2, param3) end

function connectivity_c.clearFriendBtnHints() end

---@class UIRoot_consoleHintsPS_c: FlashObject @consoleHintsPS_c
---@field btnList FlashObject
consoleHintsPS_c = {}

function consoleHintsPS_c.MainTimeline() end

---@class UIRoot_consoleHints_c: FlashObject @consoleHints_c
---@field btnList FlashObject
consoleHints_c = {}

function consoleHints_c.MainTimeline() end

---@class UIRoot_containerInventory: FlashObject @containerInventory
---@field buttonHint_mc FlashObject
---@field inv_mc FlashObject
---@field tooltipHolder_mc FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field itemsUpdateList FlashArray
---@field isDragging boolean
---@field inMultiSelect boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field controllerMode boolean
---@field uiName string
---@field playerInventory boolean
---@field tooltipTween FlashObject
---@field frameW number
---@field tooltip_array FlashArray
---@field tooltipHandle number
---@field TTimer FlashObject
---@field tooltipTweenTime number
containerInventory = {}

function containerInventory.MainTimeline() end

---@param param1 string
function containerInventory.setUIName(param1) end

function containerInventory.updateItems() end

function containerInventory.clearSlots() end

---@param param1 number
---@param param2 string
function containerInventory.setButtonTooltip(param1, param2) end

---@param param1 number
---@param param2 boolean
function containerInventory.setButtonEnabled(param1, param2) end

function containerInventory.onEventInit() end

---@param param1 number
function containerInventory.onEventDown(param1) end

---@param param1 number
function containerInventory.onEventUp(param1) end

---@param param1 boolean
function containerInventory.setMultiselection(param1) end

function containerInventory.toggleMultiselection() end

function containerInventory.clearMultiselection() end

function containerInventory.init() end

---@param param1 number
---@param param2 string
function containerInventory.setTooltipGroupLabel(param1, param2) end

function containerInventory.updateTooltip() end

function containerInventory.clearTooltip() end

---@param param1 number
function containerInventory.ShowCellTooltip(param1) end

---@param param1 FlashObject
function containerInventory.SendTooltipRequest(param1) end

---@param param1 number
---@param param2 string
function containerInventory.setContainerType(param1, param2) end

---@param param1 number
function containerInventory.setAnchor(param1) end

function containerInventory.INTSendSize() end

---@param param1 boolean
function containerInventory.setButtonsOnContainer(param1) end

---@param param1 boolean
function containerInventory.setControllerMode(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function containerInventory.addBtnHint(param1, param2, param3) end

function containerInventory.clearBtnHints() end

---@param param1 string
function containerInventory.setItemUID(param1) end

function containerInventory.onEventTerminate() end

---@param param1 string
---@param param2 string
---@return boolean
function containerInventory.startsWith(param1, param2) end

---@param param1 boolean
function containerInventory.setTakeAllBtnVisible(param1) end

---@param param1 boolean
function containerInventory.setWeightValueVisible(param1) end

---@param param1 boolean
function containerInventory.setWeightValueBarsVisible(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 number
---@param param6 number
function containerInventory.setWeightValueBars(param1, param2, param3, param4, param5, param6) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 string
function containerInventory.setWeightValueText(param1, param2, param3, param4) end

---@param param1 number
function containerInventory.selectSlot(param1) end

function containerInventory.hideTooltip() end

function containerInventory.showTooltip() end

function containerInventory.tooltipTweenDone() end

---@param param1 boolean
function containerInventory.setPlayerInventory(param1) end

---@class UIRoot_contextMenu: FlashObject @contextMenu
---@field windowsMenu_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip number
---@field hasTooltip boolean
---@field closing boolean
---@field offsetX number
---@field offsetY number
---@field tweenTime number
---@field text_array FlashArray
---@field buttonArr FlashArray
contextMenu = {}

function contextMenu.MainTimeline() end

---@param param1 string
---@param param2 boolean
function contextMenu.setTitle(param1, param2) end

function contextMenu.onEventInit() end

function contextMenu.onEventResize() end

---@return FlashObject
function contextMenu.getList() end

---@param param1 number
---@return boolean
function contextMenu.onEventUp(param1) end

---@param param1 number
---@return boolean
function contextMenu.onEventDown(param1) end

function contextMenu.resetSelection() end

function contextMenu.updateButtons() end

---@param param1 number
---@param param2 number
---@param param3 boolean
---@param param4 string
---@param param5 string
---@param param6 boolean
---@param param7 boolean
function contextMenu.addButton(param1, param2, param3, param4, param5, param6, param7) end

function contextMenu.addButtonsDone() end

---@param param1 FlashObject
---@param param2 string
function contextMenu.setIggyImage(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function contextMenu.removeChildrenOf(param1) end

function contextMenu.clearButtons() end

---@param param1 FlashObject
function contextMenu.selectButton(param1) end

function contextMenu.open() end

---@param param1 FlashObject
function contextMenu.onCloseUI(param1) end

---@param param1 FlashObject
function contextMenu.onWheel(param1) end

function contextMenu.close() end

function contextMenu.next() end

function contextMenu.previous() end

---@param param1 number
---@param param2 number
function contextMenu.setPos(param1, param2) end

---@param param1 number
---@param param2 string
function contextMenu.setText(param1, param2) end

---@class UIRoot_contextMenu_c: FlashObject @contextMenu_c
---@field windowsMenu_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip number
---@field hasTooltip boolean
---@field closing boolean
---@field tweenTime number
---@field offsetX number
---@field offsetY number
---@field buttonArr FlashArray
---@field mouseBorder number
contextMenu_c = {}

function contextMenu_c.MainTimeline() end

function contextMenu_c.onEventInit() end

function contextMenu_c.onEventResize() end

---@param param1 number
---@return boolean
function contextMenu_c.onEventDown(param1) end

---@param param1 number
---@return boolean
function contextMenu_c.onEventUp(param1) end

function contextMenu_c.resetSelection() end

function contextMenu_c.updateButtons() end

---@param param1 string
---@param param2 boolean
function contextMenu_c.setTitle(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 boolean
---@param param4 string
---@param param5 string
---@param param6 boolean
---@param param7 boolean
function contextMenu_c.addButton(param1, param2, param3, param4, param5, param6, param7) end

function contextMenu_c.addButtonsDone() end

---@param param1 FlashObject
---@return FlashObject
function contextMenu_c.removeChildrenOf(param1) end

function contextMenu_c.clearButtons() end

---@param param1 FlashObject
function contextMenu_c.selectButton(param1) end

---@param param1 boolean
function contextMenu_c.open(param1) end

function contextMenu_c.close() end

function contextMenu_c.resetToDefault() end

function contextMenu_c.next() end

function contextMenu_c.previous() end

---@param param1 boolean
function contextMenu_c.setListLoopable(param1) end

---@class UIRoot_craftPanel_c: FlashObject @craftPanel_c
---@field btnHintHolder_mc FlashObject
---@field craftPanel_mc FlashObject
---@field events FlashArray
---@field layout string
---@field ingredientCellSize number
---@field recipeIngredientCellSize number
---@field invCellSize number
---@field invCellSpacing number
---@field invBgDiscrap number
---@field invCellBgSizeDiff number
---@field invRows number
---@field invCols number
---@field invRuneRows number
---@field invRuneCols number
---@field allowSound boolean
---@field itemsUpdateList FlashArray
---@field charIconW number
---@field charIconH number
---@field ingredientsCount number
---@field runeslotsCount number
---@field recipePanelID number
---@field experimentPanelID number
---@field runePanelID number
---@field buttonHint_mc FlashObject
---@field ignorePress boolean
---@field text_array FlashArray
---@field tooltipHandle number
---@field TTimer FlashObject
---@field tooltip_array FlashArray
---@field recipe_array FlashArray
---@field recipeCount_array FlashArray
---@field runeslotUpdateList FlashArray
craftPanel_c = {}

function craftPanel_c.MainTimeline() end

function craftPanel_c.onEventResize() end

---@param param1 number
function craftPanel_c.onEventDown(param1) end

---@param param1 number
function craftPanel_c.onEventUp(param1) end

---@param param1 number
---@param param2 boolean
function craftPanel_c.setPlayer(param1, param2) end

function craftPanel_c.onEventInit() end

---@param param1 string
function craftPanel_c.setPanelTitle(param1) end

---@param param1 number
function craftPanel_c.setAnchor(param1) end

---@param param1 string
---@param param2 boolean
function craftPanel_c.setStation(param1, param2) end

---@param param1 number
---@param param2 string
function craftPanel_c.setText(param1, param2) end

function craftPanel_c.startCraft() end

---@param param1 number
function craftPanel_c.INV_ShowCellTooltip(param1) end

---@param param1 FlashObject
function craftPanel_c.INV_SendTooltipRequest(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 number
---@param param5 boolean
---@param param6 boolean
function craftPanel_c.setIngredient(param1, param2, param3, param4, param5, param6) end

---@param param1 string
function craftPanel_c.setRecipeResult(param1) end

---@param param1 boolean
function craftPanel_c.setContainerMode(param1) end

---@param param1 number
---@param param2 boolean
function craftPanel_c.showBreadcrumb(param1, param2) end

---@param param1 number
function craftPanel_c.showCraftPanel(param1) end

---@param param1 number
function craftPanel_c.showPanel(param1) end

function craftPanel_c.updateItems() end

---@param param1 number
function craftPanel_c.setInventorySlotSelection(param1) end

---@param param1 string
function craftPanel_c.setNoRuneWeaponsError(param1) end

function craftPanel_c.clearSlots() end

---@param param1 string
---@param param2 boolean
function craftPanel_c.setResult(param1, param2) end

function craftPanel_c.startCraftRecipe() end

---@param param1 number
function craftPanel_c.updateProgress(param1) end

function craftPanel_c.showResult() end

function craftPanel_c.cancelCraft() end

---@param param1 number
---@param param2 string
---@param param3 number
function craftPanel_c.addBtnHint(param1, param2, param3) end

function craftPanel_c.clearBtnHints() end

---@param param1 number
---@param param2 string
function craftPanel_c.setTooltipGroupLabel(param1, param2) end

function craftPanel_c.updateTooltip() end

function craftPanel_c.clearTooltip() end

function craftPanel_c.hideTooltip() end

function craftPanel_c.updateArraySystem() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 boolean
function craftPanel_c.addRecipe(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 number
---@param param3 string
function craftPanel_c.setRecipeAmount(param1, param2, param3) end

function craftPanel_c.removeRecipes() end

---@param param1 number
---@param param2 string
function craftPanel_c.addRecipeGroup(param1, param2) end

---@param param1 number
---@param param2 string
function craftPanel_c.addTab(param1, param2) end

---@param param1 number
function craftPanel_c.setMaxRecipeIngredients(param1) end

---@param param1 number
function craftPanel_c.setRecipeMaxCraftAmount(param1) end

function craftPanel_c.updateRuneSlots() end

---@param param1 number
function craftPanel_c.setCraftResultHandle(param1) end

---@param param1 boolean
---@param param2 boolean
function craftPanel_c.setCraftInventoryPanelVisible(param1, param2) end

---@param param1 number
---@param param2 boolean
function craftPanel_c.setTabEnabled(param1, param2) end

---@class UIRoot_dialog: FlashObject @dialog
---@field dialog_mc FlashObject
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field events FlashArray
---@field layout string
---@field iconHeight number
---@field iconWidth number
---@field answerMode boolean
---@field addTextArray FlashArray
---@field addAHArray FlashArray
---@field addKWAnswerArray FlashArray
dialog = {}

function dialog.MainTimeline() end

function dialog.onEventInit() end

---@param param1 number
function dialog.setAnchorId(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function dialog.startsWith(param1, param2) end

---@param param1 number
function dialog.onEventUp(param1) end

---@param param1 number
function dialog.onEventDown(param1) end

function dialog.addAnswersDone() end

---@return FlashObject
function dialog.hideDialog() end

---@return FlashObject
function dialog.showDialog() end

---@return FlashObject
function dialog.hideWin() end

---@return FlashObject
function dialog.showWin() end

---@param param1 number
---@return FlashObject
function dialog.setX(param1) end

---@param param1 number
---@return FlashObject
function dialog.setY(param1) end

---@return number
function dialog.getHeight() end

---@return number
function dialog.getWidth() end

function dialog.resetSelection() end

function dialog.clearAnswers() end

function dialog.clearTexts() end

function dialog.clearAll() end

---@return FlashObject
function dialog.executeSelected() end

---@param param1 boolean
function dialog.moveSelection(param1) end

function dialog.updateDialog() end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
function dialog.addText(param1, param2, param3, param4) end

function dialog.showBufferedAnswer() end

---@param param1 string
---@param param2 string
---@param param3 number
---@param param4 boolean
function dialog.addAnswerHolder(param1, param2, param3, param4) end

function dialog.removeAnswerHolder() end

---@param param1 string
function dialog.addAnswers(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
function dialog.addKeywordAnswer(param1, param2, param3) end

---@param param1 string
function dialog.setWaitingText(param1) end

---@param param1 number
function dialog.chooseAnswer(param1) end

---@param param1 number
function dialog.highlightAnswer(param1) end

---@param param1 boolean
function dialog.setAlternativeScrollMode(param1) end

---@param param1 string
function dialog.setTradeBtnTooltip(param1) end

---@param param1 boolean
function dialog.setTradeBtnVisible(param1) end

---@param param1 boolean
function dialog.setStopListenBtnVisible(param1) end

---@param param1 boolean
function dialog.setWaitingTextVisible(param1) end

---@param param1 boolean
function dialog.setTradeBtnDisabled(param1) end

function dialog.showDiscussion() end

function dialog.hideDiscussion() end

---@param param1 number
---@param param2 string
function dialog.setDiscussionLabels(param1, param2) end

---@param param1 number
---@param param2 boolean
function dialog.setDiscussionLabelVisible(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 string
function dialog.setDiscussionPlayer(param1, param2, param3, param4, param5, param6) end

---@param param1 string
function dialog.setPlayerWonText(param1) end

---@param param1 boolean
function dialog.setDiscussionWaitingTextVisible(param1) end

---@param param1 number
---@param param2 number
function dialog.setDiscussionPlayerGainsPoints(param1, param2) end

---@param param1 number
---@param param2 number
function dialog.setDiscussionPlayersPoints(param1, param2) end

function dialog.skipDiscussionAnimation() end

---@param param1 string
function dialog.setDiscussionCounterText(param1) end

---@param param1 number
function dialog.discussionCountDownStart(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function dialog.discussionShowBattle(param1, param2, param3) end

function dialog.enableRPSButtons() end

function dialog.disableRPSButtons() end

---@class UIRoot_dialog_c: FlashObject @dialog_c
---@field dialog_mc FlashObject
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field events FlashArray
---@field layout string
---@field iconHeight number
---@field iconWidth number
---@field answerMode boolean
---@field isListening boolean
---@field addTextArray FlashArray
---@field addAHArray FlashArray
---@field addKWAnswerArray FlashArray
---@field endTurnHintP1Enabled boolean
---@field endTurnHintP2Enabled boolean
dialog_c = {}

function dialog_c.MainTimeline() end

function dialog_c.onEventResize() end

---@param param1 boolean
function dialog_c.setShared(param1) end

function dialog_c.onEventInit() end

---@param param1 number
function dialog_c.setAnchorId(param1) end

---@param param1 number
function dialog_c.setAnchor(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function dialog_c.startsWith(param1, param2) end

---@param param1 number
function dialog_c.onEventUp(param1) end

function dialog_c.showBufferedAnswer() end

---@param param1 number
---@param param2 number
---@param param3 number
function dialog_c.onEventDown(param1, param2, param3) end

---@param param1 boolean
function dialog_c.pressedAutoresolve(param1) end

---@param param1 boolean
function dialog_c.releasedAutoresolve(param1) end

function dialog_c.addAnswersDone() end

---@return FlashObject
function dialog_c.hideDialog() end

---@return FlashObject
function dialog_c.showDialog() end

---@return FlashObject
function dialog_c.hideWin() end

---@return FlashObject
function dialog_c.showWin() end

---@param param1 number
---@return FlashObject
function dialog_c.setX(param1) end

---@param param1 number
---@return FlashObject
function dialog_c.setY(param1) end

---@return number
function dialog_c.getHeight() end

---@return number
function dialog_c.getWidth() end

function dialog_c.resetSelection() end

---@param param1 number
function dialog_c.setCursorPosition(param1) end

function dialog_c.clearAnswers() end

function dialog_c.clearTexts() end

function dialog_c.clearAll() end

---@return FlashObject
function dialog_c.executeSelected() end

---@param param1 boolean
function dialog_c.moveSelection(param1) end

function dialog_c.updateDialog() end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
function dialog_c.addText(param1, param2, param3, param4) end

---@param param1 string
---@param param2 string
---@param param3 number
---@param param4 boolean
function dialog_c.addAnswerHolder(param1, param2, param3, param4) end

---@param param1 boolean
function dialog_c.setAnswerHolderActive(param1) end

function dialog_c.removeAnswerHolder() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function dialog_c.addKeywordAnswer(param1, param2, param3) end

---@param param1 string
function dialog_c.setTalkingNPCIcon(param1) end

---@param param1 string
function dialog_c.setWaitingText(param1) end

---@param param1 number
function dialog_c.chooseAnswer(param1) end

---@param param1 number
function dialog_c.highlightAnswer(param1) end

---@param param1 boolean
function dialog_c.setAlternativeScrollMode(param1) end

---@param param1 boolean
function dialog_c.setDialogIsDualDialog(param1) end

---@param param1 string
function dialog_c.setTradeBtnTooltip(param1) end

---@param param1 boolean
function dialog_c.setTradeBtnVisible(param1) end

---@param param1 boolean
function dialog_c.setWaitingTextVisible(param1) end

---@param param1 boolean
function dialog_c.setStopListenBtnVisible(param1) end

---@param param1 boolean
function dialog_c.setTradeBtnDisabled(param1) end

function dialog_c.showDiscussion() end

function dialog_c.hideDiscussion() end

---@param param1 number
---@param param2 string
function dialog_c.setDiscussionLabels(param1, param2) end

---@param param1 number
---@param param2 boolean
function dialog_c.setDiscussionLabelVisible(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 string
function dialog_c.setDiscussionPlayer(param1, param2, param3, param4, param5, param6) end

---@param param1 string
function dialog_c.setPlayerWonText(param1) end

---@param param1 boolean
function dialog_c.setDiscussionWaitingTextVisible(param1) end

---@param param1 number
---@param param2 number
function dialog_c.setDiscussionPlayerGainsPoints(param1, param2) end

---@param param1 number
---@param param2 number
function dialog_c.setDiscussionPlayersPoints(param1, param2) end

function dialog_c.skipDiscussionAnimation() end

---@param param1 string
function dialog_c.setDiscussionCounterText(param1) end

---@param param1 number
function dialog_c.discussionCountDownStart(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function dialog_c.discussionShowBattle(param1, param2, param3) end

---@param param1 boolean
function dialog_c.enableRPSButtons(param1) end

---@param param1 boolean
function dialog_c.disableRPSButtons(param1) end

---@param param1 number
---@param param2 boolean
function dialog_c.selectRPSButton(param1, param2) end

---@param param1 boolean
function dialog_c.switchScreenMode(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function dialog_c.addBtnHint(param1, param2, param3) end

function dialog_c.clearBtnHints() end

---@return boolean
function dialog_c.hasVisibleDialog() end

---@param param1 boolean
function dialog_c.showEndTurnHint(param1) end

---@param param1 boolean
function dialog_c.hideEndTurnHint(param1) end

---@param param1 boolean
function dialog_c.showEndTurnHint_INT(param1) end

---@param param1 boolean
function dialog_c.hideEndTurnHint_INT(param1) end

function dialog_c.hideEndTurnHintP1Done() end

function dialog_c.hideEndTurnHintP2Done() end

---@param param1 boolean
function dialog_c.showHoldEndTurnHint(param1) end

---@param param1 boolean
function dialog_c.hideHoldEndTurnHint(param1) end

---@param param1 boolean
function dialog_c.hideHoldEndTurnHintDone(param1) end

---@param param1 boolean
---@return FlashObject
function dialog_c.swapUIType(param1) end

---@class UIRoot_diplomacy: FlashObject @diplomacy
---@field panel_mc FlashObject
---@field neutralColour number
---@field allyColour number
---@field friendlyColour number
---@field enemyColour number
---@field charIconHeight number
---@field charIconWidth number
---@field uiLeft number
---@field uiRight number
---@field uiTop number
---@field uiMinHeight number
---@field uiMinWidth number
---@field characterIconHeight number
---@field characterIconWidth number
---@field playerIconHeight number
---@field playerIconWidth number
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field leftPanelW number
---@field events FlashArray
---@field layout string
---@field alignment string
---@field characterArray FlashArray
---@field alignmentText FlashArray
---@field buttonTooltip FlashArray
diplomacy = {}

function diplomacy.MainTimeline() end

function diplomacy.onEventInit() end

---@param id number
---@return boolean
function diplomacy.onEventUp(id) end

---@param id number
---@return boolean
function diplomacy.onEventDown(id) end

---@param str string
function diplomacy.setTitle(str) end

---@param str string
function diplomacy.setButtonText(str) end

---@param str string
function diplomacy.setCheckBoxLabel(str) end

---@param isSharing boolean
function diplomacy.setShareJournal(isSharing) end

function diplomacy.updateCharacterList() end

---@class UIRoot_dummyOverhead: FlashObject @dummyOverhead
---@field events FlashArray
---@field layout string
---@field overhead_array FlashArray
dummyOverhead = {}

function dummyOverhead.MainTimeline() end

---@param param1 number
function dummyOverhead.onEventUp(param1) end

---@param param1 number
function dummyOverhead.onEventDown(param1) end

function dummyOverhead.onEventResize() end

function dummyOverhead.onEventInit() end

---@param param1 number
function dummyOverhead.setAnchor(param1) end

---@param param1 number
---@param param2 string
function dummyOverhead.setText(param1, param2) end

---@param param1 number
function dummyOverhead.fadeOutText(param1) end

---@param param1 number
---@return FlashObject
function dummyOverhead.getTextObj(param1) end

function dummyOverhead.clearObsoleteTexts() end

---@param param1 FlashObject
function dummyOverhead.remove(param1) end

---@param param1 FlashObject
---@return number
function dummyOverhead.getOHTPos(param1) end

---@class UIRoot_enemyHealthBar: FlashObject @enemyHealthBar
---@field hp_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip number
---@field hasTooltip boolean
---@field statusList FlashObject
---@field fadeTime number
---@field status_array FlashArray
enemyHealthBar = {}

function enemyHealthBar.MainTimeline() end

function enemyHealthBar.onEventResize() end

---@param param1 number
function enemyHealthBar.onEventUp(param1) end

---@param param1 number
function enemyHealthBar.onEventDown(param1) end

function enemyHealthBar.onEventInit() end

function enemyHealthBar.clearTweens() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function enemyHealthBar.setHPBars(param1, param2, param3) end

---@param param1 number
function enemyHealthBar.setHPColour(param1) end

---@param param1 number
---@param param2 boolean
---@param param3 string
---@param param4 boolean
function enemyHealthBar.setArmourBar(param1, param2, param3, param4) end

---@param param1 number
function enemyHealthBar.setArmourBarColour(param1) end

---@param param1 number
---@param param2 boolean
---@param param3 string
---@param param4 boolean
function enemyHealthBar.setMagicArmourBar(param1, param2, param3, param4) end

---@param param1 number
function enemyHealthBar.setMagicArmourBarColour(param1) end

---@param param1 string
---@param param2 string
---@param param3 boolean
function enemyHealthBar.setText(param1, param2, param3) end

function enemyHealthBar.requestAnchorCombatTurn() end

function enemyHealthBar.requestAnchorScreen() end

---@param param1 boolean
function enemyHealthBar.show(param1) end

function enemyHealthBar.hide() end

function enemyHealthBar.hideHPMC() end

---@param param1 boolean
function enemyHealthBar.updateStatuses(param1) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 string
function enemyHealthBar.setStatus(param1, param2, param3, param4, param5, param6, param7) end

function enemyHealthBar.cleanupStatuses() end

function enemyHealthBar.clearStatusses() end

---@param param1 FlashObject
---@param param2 string
function enemyHealthBar.setIggyImage(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function enemyHealthBar.removeChildrenOf(param1) end

---@class UIRoot_engrave: FlashObject @engrave
---@field popup_mc FlashObject
---@field events FlashArray
---@field layout string
---@field totalCharCount number
---@field text_array FlashArray
---@field timer FlashObject
engrave = {}

function engrave.MainTimeline() end

function engrave.onEventInit() end

function engrave.onEventResize() end

---@param param1 number
---@return boolean
function engrave.onEventUp(param1) end

---@param param1 number
---@return boolean
function engrave.onEventDown(param1) end

---@param param1 number
function engrave.setAnchor(param1) end

function engrave.hidePopup() end

---@param param1 number
---@param param2 string
function engrave.setText(param1, param2) end

function engrave.test() end

---@class UIRoot_equipmentPanel_c: FlashObject @equipmentPanel_c
---@field mainpanel_mc FlashObject
---@field events FlashArray
---@field layout string
---@field isDragging boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field invCellSize number
---@field dollCellSize number
---@field invCellSpacing number
---@field invCellBgSizeDiff number
---@field invBgDiscrap number
---@field invRows number
---@field invCols number
---@field charIconW number
---@field charIconH number
---@field equipmentSlotsAmount number
---@field equipmentSlot_array FlashArray
---@field equipInvItemsUpdateList FlashArray
---@field equipDollItemsUpdateList FlashArray
---@field initDone boolean
---@field hasCanceled boolean
---@field downInputEvent string
---@field text_array FlashArray
---@field tooltip_array FlashArray
---@field equipTooltip_array FlashArray
---@field ttTween FlashObject
---@field tooltipHandle number
---@field TTimer FlashObject
equipmentPanel_c = {}

function equipmentPanel_c.MainTimeline() end

---@param param1 string
function equipmentPanel_c.setPanelTitle(param1) end

function equipmentPanel_c.onEventResize() end

---@param param1 number
---@param param2 boolean
function equipmentPanel_c.setPlayer(param1, param2) end

---@param param1 number
function equipmentPanel_c.onEventDown(param1) end

---@param param1 number
function equipmentPanel_c.onEventUp(param1) end

---@param param1 boolean
function equipmentPanel_c.disableOffhandSlot(param1) end

function equipmentPanel_c.onEventInit() end

---@param param1 number
function equipmentPanel_c.setAnchor(param1) end

---@param param1 boolean
function equipmentPanel_c.setHLOnRT(param1) end

---@param param1 boolean
function equipmentPanel_c.setHLOnLT(param1) end

---@param param1 number
---@param param2 string
function equipmentPanel_c.setText(param1, param2) end

---@param param1 number
function equipmentPanel_c.selectDollSlot(param1) end

---@param param1 number
---@param param2 string
function equipmentPanel_c.setTooltipGroupLabel(param1, param2) end

---@param param1 number
---@param param2 string
function equipmentPanel_c.setTooltipCompareHint(param1, param2) end

---@param param1 boolean
function equipmentPanel_c.setTooltipPanelVisible(param1) end

function equipmentPanel_c.updateTooltip() end

function equipmentPanel_c.updateEquipTooltip() end

function equipmentPanel_c.clearTooltip() end

function equipmentPanel_c.tooltipFadeDone() end

function equipmentPanel_c.clearEquipTooltip() end

---@param param1 string
---@param param2 string
function equipmentPanel_c.setTooltip(param1, param2) end

---@param param1 string
---@param param2 string
function equipmentPanel_c.setEquippedTitle(param1, param2) end

function equipmentPanel_c.toggleTooltip() end

---@param param1 boolean
function equipmentPanel_c.enableCompare(param1) end

---@param param1 number
function equipmentPanel_c.ShowCellTooltip(param1) end

---@param param1 FlashObject
function equipmentPanel_c.SendTooltipRequest(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function equipmentPanel_c.addBtnHint(param1, param2, param3) end

function equipmentPanel_c.clearBtnHints() end

function equipmentPanel_c.switchCursorFocus() end

---@param param1 boolean
function equipmentPanel_c.setCursorFocusOnDoll(param1) end

function equipmentPanel_c.showPanel() end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 string
function equipmentPanel_c.setMainInfoStats(param1, param2, param3, param4) end

function equipmentPanel_c.updateInventoryItems() end

function equipmentPanel_c.updateEquipmentItems() end

---@param param1 number
---@param param2 number
---@param param3 string
function equipmentPanel_c.addEquipmentTab(param1, param2, param3) end

function equipmentPanel_c.refreshTabsPos() end

function equipmentPanel_c.removeEquipmentTabs() end

---@param param1 number
function equipmentPanel_c.selectEquipmentTab(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 number
function equipmentPanel_c.addStat(param1, param2, param3, param4) end

---@param param1 string
function equipmentPanel_c.addStatText(param1) end

function equipmentPanel_c.addStatLine() end

---@param param1 number
function equipmentPanel_c.addStatSpacing(param1) end

function equipmentPanel_c.clearMainStats() end

---@param param1 string
---@param param2 string
---@return boolean
function equipmentPanel_c.startsWith(param1, param2) end

---@param param1 boolean
function equipmentPanel_c.setActionsDisabled(param1) end

---@param param1 boolean
---@return FlashObject
function equipmentPanel_c.setHelmetVisibility(param1) end

---@class UIRoot_examine: FlashObject @examine
---@field examine_mc FlashObject
---@field events FlashArray
---@field layout string
---@field isDragging boolean
---@field hasTooltip boolean
---@field curTooltip number
---@field keepCustomInScreen boolean
---@field uiLeft number
---@field uiRight number
---@field uiTop number
---@field uiMinHeight number
---@field uiMinWidth number
---@field itemIconSize number
---@field charIconH number
---@field charIconW number
---@field userPortraitHeight number
---@field userPortraitWidth number
---@field initDone boolean
---@field addStats_array FlashArray
---@field status_array FlashArray
---@field cachedInput string
examine = {}

function examine.MainTimeline() end

---@param param1 number
function examine.onEventUp(param1) end

---@param param1 number
function examine.onEventDown(param1) end

function examine.onEventResize() end

function examine.onEventInit() end

function examine.start() end

---@param param1 number
function examine.setAnchor(param1) end

function examine.clearTooltip() end

---@param param1 number
---@param param2 string
function examine.setText(param1, param2) end

---@param param1 string
---@param param2 number
function examine.setPlayerProfile(param1, param2) end

---@param param1 boolean
---@param param2 boolean
function examine.showPortrait(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 number
function examine.addStat(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 string
---@param param3 number
function examine.addTitle(param1, param2, param3) end

function examine.update() end

---@param param1 boolean
function examine.updateStatusses(param1) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 string
---@param param6 number
---@param param7 string
function examine.addStatus(param1, param2, param3, param4, param5, param6, param7) end

---@param param1 number
---@param param2 string
function examine.setStatusTitle(param1, param2) end

function examine.clearPanel() end

---@param param1 number
function examine.selectStat(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function examine.addBtnHint(param1, param2, param3) end

function examine.clearBtnHints() end

---@param param1 FlashObject
---@return FlashObject
function examine.getGlobalPositionOfMC(param1) end

---@param param1 FlashObject
---@param param2 number
function examine.showTooltipForMC(param1, param2) end

---@param param1 string
---@param param2 string
---@return boolean
function examine.startsWith(param1, param2) end

---@class UIRoot_examine_c: FlashObject @examine_c
---@field buttonHint_mc FlashObject
---@field examine_mc FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isDragging boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field itemIconSize number
---@field charIconH number
---@field charIconW number
---@field userPortraitHeight number
---@field userPortraitWidth number
---@field initDone boolean
---@field addStats_array FlashArray
---@field status_array FlashArray
---@field tooltipArray FlashArray
---@field firstUpdate boolean
---@field _selectedEntryHasInfo boolean
---@field cachedInput string
---@field text_array FlashArray
examine_c = {}

function examine_c.MainTimeline() end

---@param param1 number
function examine_c.onEventDown(param1) end

---@param param1 number
function examine_c.onEventUp(param1) end

function examine_c.start() end

function examine_c.onEventInit() end

---@param param1 number
function examine_c.setAnchor(param1) end

function examine_c.clearTooltip() end

function examine_c.showFormattedTooltip() end

---@param param1 number
---@param param2 string
function examine_c.setText(param1, param2) end

---@param param1 string
---@param param2 number
function examine_c.setPlayerProfile(param1, param2) end

---@param param1 boolean
---@param param2 boolean
function examine_c.showPortrait(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 number
function examine_c.addStat(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 string
---@param param3 number
function examine_c.addTitle(param1, param2, param3) end

function examine_c.update() end

---@param param1 boolean
function examine_c.updateStatusses(param1) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 string
---@param param6 number
---@param param7 string
function examine_c.addStatus(param1, param2, param3, param4, param5, param6, param7) end

---@param param1 number
---@param param2 string
function examine_c.setStatusTitle(param1, param2) end

function examine_c.clearPanel() end

---@param param1 number
function examine_c.selectStat(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function examine_c.addBtnHint(param1, param2, param3) end

function examine_c.clearBtnHints() end

---@param param1 string
---@param param2 string
---@return boolean
function examine_c.startsWith(param1, param2) end

---@class UIRoot_feedback_c: FlashObject @feedback_c
---@field confirmation_mc FlashObject
---@field feedback_mc FlashObject
---@field hiddenHints_mc FlashObject
---@field info_mc FlashObject
---@field layout string
---@field alignment string
---@field events FlashArray
---@field strSendFeedback string
---@field strGeneral string
---@field strGameplay string
---@field strBug string
---@field strPerformance string
---@field strEmail string
---@field strRememberEmailAddress string
---@field strRateYourExperience string
---@field strPrivacyDisclaimer string
---@field strWhatIsThisFormInfo string
---@field strPrivacyDisclaimerInfo string
---@field strAgreeToPrivacyDisclaimer string
---@field strFeedbackSent string
---@field strDefaultFeedbackText string
---@field strDefaultEmailText string
---@field maxFeedbackSymbols number
---@field checkboxesStates FlashArray
---@field checkboxes FlashArray
feedback_c = {}

function feedback_c.MainTimeline() end

---@param param1 number
function feedback_c.setMaxFeedbackSize(param1) end

function feedback_c.initStrings() end

function feedback_c.onEventInit() end

function feedback_c.onEventResize() end

function feedback_c.onSend() end

function feedback_c.agreeBeforeComfirm() end

---@param param1 number
function feedback_c.onEventUp(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function feedback_c.onEventDown(param1, param2, param3) end

---@param param1 number
function feedback_c.setAnchor(param1) end

function feedback_c.updateCheckboxes() end

---@param param1 number
function feedback_c.setEmoji(param1) end

---@param param1 string
function feedback_c.setFeedbackText(param1) end

---@param param1 string
function feedback_c.setEmail(param1) end

function feedback_c.showConfirmation() end

---@param param1 number
---@param param2 boolean
function feedback_c.setBtnHintEnabled(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function feedback_c.addBtnHint(param1, param2, param3, param4) end

---@class UIRoot_formation: FlashObject @formation
---@field formation_mc FlashObject
---@field iconHeight number
---@field iconWidth number
---@field itemIconSize number
---@field hand1ItemHandle number
---@field hand2ItemHandle number
---@field selectedCharacterHandle number
---@field events FlashArray
---@field layout string
---@field text_array FlashArray
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field party_array FlashArray
formation = {}

function formation.MainTimeline() end

function formation.onEventInit() end

function formation.onEventResize() end

---@param param1 number
function formation.onEventUp(param1) end

---@param param1 number
function formation.onEventDown(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function formation.addBtnHint(param1, param2, param3) end

---@return FlashObject
function formation.hideWin() end

---@return FlashObject
function formation.showWin() end

---@return number
function formation.getHeight() end

---@return number
function formation.getWidth() end

---@param param1 number
---@return FlashObject
function formation.setX(param1) end

---@param param1 number
---@return FlashObject
function formation.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function formation.setPos(param1, param2) end

---@return number
function formation.getX() end

---@return number
function formation.getY() end

---@param param1 number
---@param param2 string
function formation.setText(param1, param2) end

function formation.updateParty() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
function formation.setCharOnSlot(param1, param2, param3, param4) end

---@param param1 number
function formation.setCombatCheckbox(param1) end

---@class UIRoot_formation_c: FlashObject @formation_c
---@field formations_mc FlashObject
---@field iconHeight number
---@field iconWidth number
---@field itemIconSize number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field events FlashArray
---@field layout string
---@field btnContainer_mc FlashObject
---@field text_array FlashArray
---@field party_array FlashArray
---@field addStats_array FlashArray
formation_c = {}

function formation_c.MainTimeline() end

function formation_c.onEventInit() end

---@param param1 number
function formation_c.setAnchor(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 boolean
function formation_c.setTab(param1, param2, param3, param4) end

---@param param1 number
function formation_c.selectTab(param1) end

---@param param1 number
---@param param2 boolean
function formation_c.setTabEnabled(param1, param2) end

function formation_c.onEventResize() end

---@param param1 number
function formation_c.onEventUp(param1) end

---@param param1 number
function formation_c.onEventDown(param1) end

---@param param1 number
---@param param2 number
function formation_c.moveCursor(param1, param2) end

---@param param1 number
---@param param2 string
function formation_c.setText(param1, param2) end

---@param param1 number
function formation_c.setCombatCheckbox(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function formation_c.addBtnHint(param1, param2, param3) end

function formation_c.clearBtnHints() end

function formation_c.updateParty() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
function formation_c.setCharOnSlot(param1, param2, param3, param4) end

function formation_c.updateStats() end

function formation_c.clearCharacterInfo() end

function formation_c.reset() end

---@class UIRoot_fullScreenHUD: FlashObject @fullScreenHUD
---@field forceSplitscreen_mc FlashObject
---@field events FlashArray
---@field layout string
fullScreenHUD = {}

function fullScreenHUD.MainTimeline() end

function fullScreenHUD.onEventResize() end

---@param param1 number
function fullScreenHUD.onEventDown(param1) end

---@param param1 number
function fullScreenHUD.onEventUp(param1) end

function fullScreenHUD.onEventInit() end

---@param param1 string
---@return FlashObject
function fullScreenHUD.setForceSplitscreenText(param1) end

---@param param1 boolean
function fullScreenHUD.showForceSplitscreen(param1) end

---@class UIRoot_gameMenu: FlashObject @gameMenu
---@field gameMenu_mc FlashObject
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
gameMenu = {}

function gameMenu.MainTimeline() end

function gameMenu.onEventInit() end

function gameMenu.onEventResize() end

---@param param1 number
---@return boolean
function gameMenu.onEventUp(param1) end

---@param param1 number
---@return boolean
function gameMenu.onEventDown(param1) end

---@return FlashObject
function gameMenu.hideWin() end

---@return FlashObject
function gameMenu.showWin() end

---@return number
function gameMenu.getHeight() end

---@return number
function gameMenu.getWidth() end

---@param param1 number
---@return FlashObject
function gameMenu.setX(param1) end

---@param param1 number
---@return FlashObject
function gameMenu.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function gameMenu.setPos(param1, param2) end

---@return number
function gameMenu.getX() end

---@return number
function gameMenu.getY() end

function gameMenu.openMenu() end

function gameMenu.closeMenu() end

function gameMenu.fadeIn() end

function gameMenu.fadeOut() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function gameMenu.addMenuButton(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 boolean
function gameMenu.addDefaultMenuButton(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
function gameMenu.setButtonEnabled(param1, param2) end

---@param param1 boolean
function gameMenu.setDefaultButtonEnabled(param1) end

function gameMenu.executeSelected() end

---@param param1 string
function gameMenu.moveCursor(param1) end

function gameMenu.removeItems() end

---@param param1 number
function gameMenu.setCursorPosition(param1) end

---@class UIRoot_gameMenu_c: FlashObject @gameMenu_c
---@field gameMenu_mc FlashObject
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field inputDownStr string
gameMenu_c = {}

function gameMenu_c.MainTimeline() end

function gameMenu_c.onEventInit() end

---@param param1 number
function gameMenu_c.setAnchor(param1) end

function gameMenu_c.onEventResize() end

---@param param1 number
---@return boolean
function gameMenu_c.onEventUp(param1) end

---@param param1 number
---@return boolean
function gameMenu_c.onEventDown(param1) end

---@return FlashObject
function gameMenu_c.hideWin() end

---@return FlashObject
function gameMenu_c.showWin() end

---@return number
function gameMenu_c.getHeight() end

---@return number
function gameMenu_c.getWidth() end

---@param param1 number
---@return FlashObject
function gameMenu_c.setX(param1) end

---@param param1 number
---@return FlashObject
function gameMenu_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function gameMenu_c.setPos(param1, param2) end

---@return number
function gameMenu_c.getX() end

---@return number
function gameMenu_c.getY() end

function gameMenu_c.openMenu() end

function gameMenu_c.closeMenu() end

function gameMenu_c.fadeOut() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function gameMenu_c.addMenuButton(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 boolean
function gameMenu_c.addDefaultMenuButton(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
function gameMenu_c.setButtonEnabled(param1, param2) end

---@param param1 boolean
function gameMenu_c.setDefaultButtonEnabled(param1) end

---@param param1 string
function gameMenu_c.setTitle(param1) end

function gameMenu_c.executeSelected() end

---@param param1 string
function gameMenu_c.moveCursor(param1) end

function gameMenu_c.removeItems() end

---@class UIRoot_hotBar: FlashObject @hotBar
---@field actionSkillHolder_mc FlashObject
---@field endPiece_mc FlashObject
---@field hotbar_mc FlashObject
---@field showLog_mc FlashObject
---@field firstSlotX number
---@field apX number
---@field apY number
---@field hotBarX number
---@field hotBarY number
---@field endTurnX number
---@field endTurnY number
---@field charactersheetTutorialPosX number
---@field journalTutorialPosX number
---@field mapTutorialPosX number
---@field lockTutorialPosX number
---@field switchDeckPosX number
---@field skillTutorialPosX number
---@field tutorialPosY number
---@field iconSize number
---@field iconSpacing number
---@field numberOfActions number
---@field designResolution FlashObject
---@field actionsPos number
---@field numberOfButtons number
---@field numberOfShortKeys number
---@field uiScaling number
---@field isResizing boolean
---@field isInCombat boolean
---@field inSkillPane boolean
---@field baseExpBarWidth number
---@field baseBarWidth number
---@field visualSlotWidth number
---@field barStopWidth number
---@field cellWidth number
---@field cellHeight number
---@field charIconSize number
---@field cellSpacing number
---@field currentBar number
---@field slotUpdateList FlashArray
---@field slotUpdateDataList FlashArray
---@field isDragging boolean
---@field actionsDefaultVisibility boolean
---@field layout string
---@field events FlashArray
---@field actionButtonPos number
---@field cachedSlots number
---@field expLengthOffsetPercentage number
---@field actionSkillArray FlashArray
---@field fixedBtnTooltips FlashArray
hotBar = {}

function hotBar.MainTimeline() end

function hotBar.onEventInit() end

---@param param1 number
---@param param2 number
function hotBar.onEventResolution(param1, param2) end

function hotBar.resizeExpBar() end

---@param param1 string
---@param param2 string
---@return boolean
function hotBar.startsWith(param1, param2) end

---@param param1 number
function hotBar.onEventDown(param1) end

---@param param1 number
function hotBar.onEventUp(param1) end

---@param param1 number
---@param param2 boolean
function hotBar.setExp(param1, param2) end

---@param param1 number
function hotBar.setPlayerHandle(param1) end

function hotBar.updateSlots() end

---@param param1 boolean
function hotBar.setAllSlotsEnabled(param1) end

---@param param1 number
function hotBar.showActiveSkill(param1) end

function hotBar.clearAll() end

function hotBar.updateSlotData() end

---@param param1 boolean
function hotBar.allowActionsButton(param1) end

---@param param1 number
---@param param2 string
function hotBar.setText(param1, param2) end

---@param param1 FlashArray
function hotBar.setAllText(param1) end

---@param param1 number
---@param param2 boolean
function hotBar.setButtonActive(param1, param2) end

---@param param1 boolean
function hotBar.showSkillBar(param1) end

---@param param1 string
---@param param2 string
function hotBar.setLockBtnTooltips(param1, param2) end

---@param param1 number
---@param param2 boolean
function hotBar.setButtonDisabled(param1, param2) end

---@param param1 boolean
function hotBar.setLockButtonEnabled(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function hotBar.setButton(param1, param2, param3) end

---@param param1 number
function hotBar.setCurrentHotbar(param1) end

function hotBar.updateActionSkills() end

---@param param1 boolean
function hotBar.setActionSkillHolderVisible(param1) end

function hotBar.toggleActionSkillHolder() end

---@param param1 string
---@param param2 boolean
function hotBar.setActionPreview(param1, param2) end

---@param param1 boolean
function hotBar.setHotbarLocked(param1) end

---@param param1 number
---@param param2 string
function hotBar.setFixedBtnTooltips(param1, param2) end

---@class UIRoot_installScreen_c: FlashObject @installScreen_c
---@field btnContainer_mc FlashObject
---@field errorText_txt FlashObject
---@field loadingScreen_mc FlashObject
---@field events FlashArray
---@field layout string
---@field buttonHints FlashArray
---@field text_array FlashArray
installScreen_c = {}

function installScreen_c.MainTimeline() end

function installScreen_c.onEventResize() end

---@param param1 number
function installScreen_c.onEventUp(param1) end

function installScreen_c.onEventInit() end

---@param param1 number
function installScreen_c.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function installScreen_c.startsWith(param1, param2) end

---@param param1 number
---@param param2 string
function installScreen_c.setText(param1, param2) end

---@return FlashObject
function installScreen_c.hideWin() end

---@return FlashObject
function installScreen_c.showWin() end

---@return number
function installScreen_c.getHeight() end

---@return number
function installScreen_c.getWidth() end

---@param param1 number
---@return FlashObject
function installScreen_c.setX(param1) end

---@param param1 number
---@return FlashObject
function installScreen_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function installScreen_c.setPos(param1, param2) end

---@return number
function installScreen_c.getX() end

---@return number
function installScreen_c.getY() end

---@param param1 string
function installScreen_c.setLoadingInfoText(param1) end

---@param param1 string
function installScreen_c.setTitle(param1) end

---@param param1 string
function installScreen_c.setLoadingStageText(param1) end

---@param param1 number
function installScreen_c.setBar1Progress(param1) end

---@param param1 string
function installScreen_c.addDebugText(param1) end

---@param param1 string
---@param param2 boolean
function installScreen_c.setInfoText(param1, param2) end

function installScreen_c.fadeOut() end

---@param param1 number
function installScreen_c.setFadeSpeed(param1) end

---@param param1 number
---@param param2 string
function installScreen_c.startFade(param1, param2) end

---@param param1 number
function installScreen_c.setBG(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function installScreen_c.addBtnHint(param1, param2, param3) end

function installScreen_c.clearBtnHints() end

---@class UIRoot_inventorySkillPanel_c: FlashObject @inventorySkillPanel_c
---@field mainpanel_mc FlashObject
---@field tooltipTweenTime number
---@field origContainerPos number
---@field origCharIggyPos number
---@field origCharFramePos number
---@field origButtonHintPos number
---@field origTitlePos number
---@field origTabBarPos number
---@field singlePlayerTabBarOffset number
---@field singlePlayerTitleOffset number
---@field singlePlayerButtonHintOffset number
---@field singlePlayerCharIconOffset number
---@field singlePlayerSkillPos number
---@field singlePlayerMemPos number
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isDragging boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field numSkillSchools number
---@field isSplit boolean
---@field invCellSize number
---@field invCellSpacing number
---@field invCellBgSizeDiff number
---@field invBgDiscrap number
---@field invRows number
---@field invCols number
---@field charIconW number
---@field charIconH number
---@field allowSound boolean
---@field allowSkillSound boolean
---@field skillSpacing number
---@field skillHeight number
---@field skillListSpacing number
---@field itemsUpdateList FlashArray
---@field skillTabTooltip FlashArray
---@field skillsUpdateList FlashArray
---@field memoryUpdateList FlashArray
---@field memoryText FlashArray
---@field skillAbilityLevel FlashArray
---@field skillsColors FlashArray
---@field initDone boolean
---@field disableActions boolean
---@field hasTooltipEnabled boolean
---@field hasCanceled boolean
---@field multiselectionPaintOn boolean
---@field multiselectionMode boolean
---@field _paintMode boolean
---@field paintValue boolean
---@field inSinglePlayerMode boolean
---@field memoryListTitle FlashArray
---@field memoryIconSize number
---@field memoryIconHSpacing number
---@field memoryIconVSpacing number
---@field mumberOfMemoryCols number
---@field memoryListSpacing number
---@field tooltip_array FlashArray
---@field text_array FlashArray
---@field tooltipHandle number
---@field TTimer FlashObject
---@field schoolText_array FlashArray
---@field tooltipFade FlashObject
---@field shouldClearTooltip boolean
---@field equipTooltip_array FlashArray
---@field equipOffhandTooltip_array FlashArray
---@field currentComp number
inventorySkillPanel_c = {}

function inventorySkillPanel_c.MainTimeline() end

---@param param1 boolean
function inventorySkillPanel_c.setMainPanelVisible(param1) end

---@param param1 boolean
---@return FlashObject
function inventorySkillPanel_c.setPaintMode(param1) end

---@return boolean
function inventorySkillPanel_c.getPaintMode() end

---@param param1 boolean
function inventorySkillPanel_c.setSinglePlayerMode(param1) end

---@param param1 boolean
function inventorySkillPanel_c.setActionMode(param1) end

---@param param1 number
function inventorySkillPanel_c.setAmountOfPlayers(param1) end

---@param param1 number
function inventorySkillPanel_c.onEventDown(param1) end

---@param param1 boolean
---@param param2 boolean
function inventorySkillPanel_c.setSlotMode(param1, param2) end

---@param param1 number
function inventorySkillPanel_c.onEventUp(param1) end

---@param param1 string
function inventorySkillPanel_c.setPanelTitle(param1) end

---@param param1 number
---@param param2 string
function inventorySkillPanel_c.setTooltipGroupLabel(param1, param2) end

---@param param1 number
---@param param2 boolean
function inventorySkillPanel_c.setPlayer(param1, param2) end

function inventorySkillPanel_c.updateItemTooltip() end

function inventorySkillPanel_c.updateSkillTooltip() end

function inventorySkillPanel_c.clearTooltip() end

function inventorySkillPanel_c.onEventInit() end

---@param param1 number
function inventorySkillPanel_c.setAnchor(param1) end

---@param param1 boolean
function inventorySkillPanel_c.setSplitScreen(param1) end

---@param param1 boolean
function inventorySkillPanel_c.setHLOnRT(param1) end

---@param param1 boolean
function inventorySkillPanel_c.setHLOnLT(param1) end

---@param param1 number
---@param param2 string
function inventorySkillPanel_c.setText(param1, param2) end

---@param param1 number
function inventorySkillPanel_c.INV_ShowCellTooltip(param1) end

---@param param1 FlashObject
function inventorySkillPanel_c.INV_SendTooltipRequest(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function inventorySkillPanel_c.addBtnHint(param1, param2, param3) end

function inventorySkillPanel_c.clearBtnHints() end

function inventorySkillPanel_c.setSkillSchoolTexts() end

---@param param1 number
function inventorySkillPanel_c.showPanel(param1) end

---@param param1 FlashObject
function inventorySkillPanel_c.setInventorySelection(param1) end

---@param param1 string
---@param param2 number
---@param param3 number
function inventorySkillPanel_c.setMemory(param1, param2, param3) end

function inventorySkillPanel_c.updateArraySystem() end

---@param param1 string
---@param param2 string
function inventorySkillPanel_c.setItemSkillTooltip(param1, param2) end

function inventorySkillPanel_c.updateItems() end

---@param param1 number
function inventorySkillPanel_c.setInventorySlotSelection(param1) end

function inventorySkillPanel_c.clearSlots() end

---@param param1 number
---@param param2 number
---@param param3 string
function inventorySkillPanel_c.addInventoryFilter(param1, param2, param3) end

function inventorySkillPanel_c.removeInventoryFilters() end

---@param param1 number
function inventorySkillPanel_c.selectInventoryFilter(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function inventorySkillPanel_c.addSkillFilter(param1, param2, param3) end

function inventorySkillPanel_c.removeSkillFilters() end

---@param param1 number
function inventorySkillPanel_c.selectSkillFilter(param1) end

---@param param1 string
---@param param2 number
---@param param3 string
---@param param4 number
---@param param5 number
---@param param6 boolean
---@param param7 number
---@param param8 string
function inventorySkillPanel_c.addSkill(param1, param2, param3, param4, param5, param6, param7, param8) end

function inventorySkillPanel_c.clearSkills() end

---@param param1 string
---@param param2 string
---@return boolean
function inventorySkillPanel_c.startsWith(param1, param2) end

---@param param1 boolean
function inventorySkillPanel_c.setActionsDisabled(param1) end

---@param param1 boolean
---@param param2 boolean
function inventorySkillPanel_c.hideTooltip(param1, param2) end

---@param param1 boolean
function inventorySkillPanel_c.showTooltip(param1) end

---@param param1 boolean
function inventorySkillPanel_c.tooltipTweenDone(param1) end

---@return boolean
function inventorySkillPanel_c.canShowTooltip() end

function inventorySkillPanel_c.updateEquipTooltip() end

function inventorySkillPanel_c.updateEquipOffhandTooltip() end

function inventorySkillPanel_c.clearEquipTooltip() end

---@param param1 string
function inventorySkillPanel_c.setOffhandString(param1) end

---@param param1 boolean
function inventorySkillPanel_c.enableCompare(param1) end

---@param param1 number
---@param param2 string
function inventorySkillPanel_c.setTooltipCompareHint(param1, param2) end

function inventorySkillPanel_c.clearTooltipCompareHints() end

---@param param1 boolean
function inventorySkillPanel_c.setMultiselectionMode(param1) end

function inventorySkillPanel_c.clearMultiselection() end

function inventorySkillPanel_c.restorePositionTooltip() end

---@class UIRoot_itemAction: FlashObject @itemAction
---@field left_mc FlashObject
---@field right_mc FlashObject
---@field events FlashArray
---@field layout string
itemAction = {}

function itemAction.MainTimeline() end

function itemAction.onEventInit() end

function itemAction.onEventResize() end

---@param param1 number
function itemAction.setAnchor(param1) end

---@param param1 number
function itemAction.onEventDown(param1) end

---@param param1 number
function itemAction.onEventUp(param1) end

---@param param1 string
---@param param2 string
---@param param3 number
function itemAction.addItemAction(param1, param2, param3) end

---@class UIRoot_itemSplitter: FlashObject @itemSplitter
---@field splitter_mc FlashObject
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field gmPanelContext boolean
itemSplitter = {}

function itemSplitter.MainTimeline() end

function itemSplitter.onEventInit() end

function itemSplitter.onEventResize() end

---@param param1 number
function itemSplitter.setAnchor(param1) end

---@param param1 number
function itemSplitter.onEventUp(param1) end

---@param param1 number
function itemSplitter.onEventDown(param1) end

---@param param1 string
function itemSplitter.setTitle(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function itemSplitter.startsWith(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 boolean
function itemSplitter.setValues(param1, param2, param3, param4) end

---@param param1 number
---@param param2 string
function itemSplitter.setButtonText(param1, param2) end

function itemSplitter.clearButtons() end

---@param param1 string
function itemSplitter.setGoldValue(param1) end

---@param param1 boolean
function itemSplitter.enableOkBtn(param1) end

---@class UIRoot_itemSplitter_c: FlashObject @itemSplitter_c
---@field splitter_mc FlashObject
---@field hideTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field canAccept boolean
---@field hiddenX number
---@field hiddenY number
---@field hiddenAlpha number
---@field animating boolean
---@field okClose boolean
itemSplitter_c = {}

function itemSplitter_c.MainTimeline() end

function itemSplitter_c.onEventInit() end

function itemSplitter_c.onEventResize() end

---@param param1 number
function itemSplitter_c.setAnchor(param1) end

---@param param1 number
function itemSplitter_c.onEventUp(param1) end

---@param param1 number
function itemSplitter_c.onEventDown(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function itemSplitter_c.addBtnHint(param1, param2, param3) end

function itemSplitter_c.clearBtnHints() end

---@param param1 string
function itemSplitter_c.setTitle(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function itemSplitter_c.startsWith(param1, param2) end

function itemSplitter_c.fadeIn() end

---@param param1 boolean
function itemSplitter_c.closeUI(param1) end

function itemSplitter_c.openFinished() end

function itemSplitter_c.closeFinished() end

---@param param1 number
---@param param2 number
---@param param3 number
function itemSplitter_c.setValues(param1, param2, param3) end

---@param param1 string
function itemSplitter_c.setGoldValue(param1) end

---@param param1 boolean
function itemSplitter_c.enableOkBtn(param1) end

---@class UIRoot_journal: FlashObject @journal
---@field journal_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip string
---@field hasTooltip boolean
---@field add_icons FlashArray
---@field add_dirs FlashArray
---@field postponeBtnText FlashArray
---@field add_quest FlashArray
---@field add_subquest FlashArray
---@field add_questInfo FlashArray
---@field add_mystery FlashArray
---@field add_mysteryInfo FlashArray
---@field add_dialog FlashArray
---@field add_dialogLine FlashArray
---@field add_tutEntry FlashArray
---@field charIconW number
---@field charIconH number
---@field collapsedHeight number
---@field text_array FlashArray
---@field questCompletedLabel string
---@field pingPoolIdx number
---@field pingPool FlashArray
---@field isMouseOverMap boolean
---@field pingModeEnabled boolean
---@field activePings FlashArray
---@field regionPos FlashArray
---@field regionRadius number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field label_array FlashArray
journal = {}

function journal.MainTimeline() end

function journal.onEventInit() end

---@param param1 number
---@param param2 string
function journal.setText(param1, param2) end

function journal.onEventResize() end

---@param param1 boolean
function journal.setMapLegendHidden(param1) end

---@param param1 string
function journal.setMapTitle(param1) end

function journal.setLabels() end

---@param param1 number
function journal.selectTab(param1) end

---@param param1 number
function journal.onEventUp(param1) end

---@param param1 number
function journal.onEventDown(param1) end

---@param param1 FlashObject
function journal.onMouseOverMap(param1) end

---@param param1 FlashObject
function journal.onMouseOutMap(param1) end

---@param param1 number
---@param param2 string
function journal.setBtnTooltip(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
---@param param5 string
---@param param6 boolean
---@param param7 boolean
---@param param8 boolean
---@param param9 number
---@param param10 number
---@param param11 boolean
function journal.addQuest(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) end

function journal.updateTutorials() end

---@param param1 boolean
function journal.setTutorialCheckboxState(param1) end

---@param param1 boolean
function journal.swapCharacter(param1) end

function journal.clearDialogs() end

---@param param1 boolean
function journal.isInArenaMode(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 boolean
function journal.addTab(param1, param2, param3, param4) end

---@param param1 number
---@param param2 boolean
function journal.setTabEnabled(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 string
function journal.addDialog(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
function journal.addDialogLine(param1, param2, param3, param4) end

function journal.executeSelected() end

---@param param1 boolean
function journal.moveCursor(param1) end

---@return FlashObject
function journal.hideWin() end

---@return FlashObject
function journal.showWin() end

---@return number
function journal.getHeight() end

---@return number
function journal.getWidth() end

---@param param1 number
---@return FlashObject
function journal.setX(param1) end

---@param param1 number
---@return FlashObject
function journal.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function journal.setPos(param1, param2) end

---@return number
function journal.getX() end

---@return number
function journal.getY() end

function journal.fadeIn() end

function journal.fadeOut() end

function journal.update() end

function journal.updateSecrets() end

---@param param1 string
function journal.updateJournal(param1) end

function journal.clearQuests() end

function journal.updateDialogLog() end

---@param param1 number
---@param param2 number
function journal.setMapOffset(param1, param2) end

function journal.clearIcons() end

---@param param1 number
function journal.trackIcon(param1) end

function journal.clearTrackIcon() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 number
---@param param6 number
---@param param7 number
---@param param8 string
function journal.setObjectIcon(param1, param2, param3, param4, param5, param6, param7, param8) end

---@param param1 number
function journal.setMapScale(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 string
function journal.setPlayerOnMap(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 boolean
function journal.setPlayer(param1, param2) end

---@param param1 number
function journal.removePlayer(param1) end

---@param param1 number
---@param param2 number
function journal.setMapSize(param1, param2) end

---@param param1 number
---@param param2 string
function journal.addLegend(param1, param2) end

function journal.clearLegend() end

---@param param1 number
---@param param2 number
---@param param3 number
function journal.ping(param1, param2, param3) end

---@param param1 FlashObject
function journal.hidePing(param1) end

---@return FlashObject
function journal.getFreePingMC() end

---@param param1 number
function journal.getActivePing(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function journal.updatePing(param1, param2, param3) end

function journal.clearOldPings() end

---@class UIRoot_journal_c: FlashObject @journal_c
---@field journal_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip string
---@field hasTooltip boolean
---@field mapPosX number
---@field mapPosY number
---@field mapXY string
---@field mapScale number
---@field add_icons FlashArray
---@field add_dirs FlashArray
---@field charIconW number
---@field charIconH number
---@field iconWidth number
---@field iconHeight number
---@field questCompletedLabel string
---@field add_quest FlashArray
---@field add_subquest FlashArray
---@field add_questInfo FlashArray
---@field add_mystery FlashArray
---@field add_mysteryInfo FlashArray
---@field add_secret FlashArray
---@field add_secretInfo FlashArray
---@field add_recipes FlashArray
---@field add_dialog FlashArray
---@field add_tutEntry FlashArray
---@field filterCompleted boolean
---@field pingPoolIdx number
---@field pingPool FlashArray
---@field activePings FlashArray
---@field showPostponed boolean
---@field onMapBtnHintId number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field panelX number
---@field panelMapX number
---@field downEvent string
---@field journalTitle FlashArray
---@field add_dialogLine FlashArray
---@field add_combatLog FlashArray
---@field waypoint_array FlashArray
journal_c = {}

function journal_c.MainTimeline() end

---@param param1 string
function journal_c.setPanelTitle(param1) end

function journal_c.hideCalled() end

function journal_c.onEventInit() end

---@param param1 number
---@param param2 boolean
function journal_c.setPlayer(param1, param2) end

---@param param1 boolean
function journal_c.setMapLegendHidden(param1) end

---@param param1 number
function journal_c.setAnchor(param1) end

function journal_c.onEventResize() end

---@param param1 number
function journal_c.onEventUp(param1) end

---@param param1 number
function journal_c.onEventDown(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function journal_c.addBtnHint(param1, param2, param3) end

function journal_c.clearBtnHints() end

function journal_c.clearSeenNewFlags() end

---@param param1 number
---@param param2 string
function journal_c.setBtnTooltip(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
---@param param5 string
---@param param6 boolean
---@param param7 boolean
---@param param8 boolean
---@param param9 number
---@param param10 number
---@param param11 boolean
function journal_c.addQuest(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) end

function journal_c.clearQuests() end

---@param param1 string
---@param param2 number
---@param param3 string
---@param param4 string
function journal_c.addTutorialEntry(param1, param2, param3, param4) end

function journal_c.resetSelection() end

function journal_c.clearTutorials() end

---@param param1 number
---@param param2 boolean
function journal_c.showBreadcrumb(param1, param2) end

---@param param1 number
---@param param2 string
function journal_c.addTab(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function journal_c.addSubTab(param1, param2, param3) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 string
function journal_c.addDialog(param1, param2, param3, param4, param5) end

function journal_c.clearDialogs() end

---@param param1 number
---@param param2 string
function journal_c.addCombatLogLine(param1, param2) end

function journal_c.clearCombatLog() end

---@param param1 number
function journal_c.selectTab(param1) end

function journal_c.executeSelected() end

---@return FlashObject
function journal_c.hideWin() end

---@return FlashObject
function journal_c.showWin() end

---@return number
function journal_c.getHeight() end

---@return number
function journal_c.getWidth() end

---@param param1 number
---@return FlashObject
function journal_c.setX(param1) end

---@param param1 number
---@return FlashObject
function journal_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function journal_c.setPos(param1, param2) end

---@return number
function journal_c.getX() end

---@return number
function journal_c.getY() end

function journal_c.fadeIn() end

function journal_c.fadeOut() end

---@param param1 number
---@param param2 string
function journal_c.addSecret(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function journal_c.addSecretInfo(param1, param2, param3) end

function journal_c.clearRecipes() end

---@param param1 number
---@param param2 string
---@param param3 string
function journal_c.addRecipe(param1, param2, param3) end

---@param param1 number
---@param param2 number
function journal_c.setTrophyKills(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 string
---@param param5 number
---@param param6 string
function journal_c.addTrophy(param1, param2, param3, param4, param5, param6) end

function journal_c.update() end

function journal_c.updateRecipes() end

---@param param1 string
---@param param2 string
function journal_c.setJournalTitle(param1, param2) end

---@param param1 string
function journal_c.updateJournal(param1) end

function journal_c.updateJournalInfo() end

function journal_c.updateDialogLog() end

function journal_c.updateDialogLogLines() end

function journal_c.updateCombatLog() end

function journal_c.updateTutorials() end

function journal_c.clearIcons() end

---@param param1 number
function journal_c.trackIcon(param1) end

function journal_c.clearTrackIcon() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 number
---@param param6 number
---@param param7 number
---@param param8 string
function journal_c.setObjectIcon(param1, param2, param3, param4, param5, param6, param7, param8) end

---@param param1 number
function journal_c.setMapScale(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 string
function journal_c.setPlayerOnMap(param1, param2, param3, param4, param5, param6) end

---@param param1 number
function journal_c.removePlayer(param1) end

---@param param1 number
---@param param2 number
function journal_c.setMapSize(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 boolean
function journal_c.setMapTitle(param1, param2, param3) end

---@param param1 number
---@param param2 string
function journal_c.addLegend(param1, param2) end

function journal_c.clearLegend() end

---@param param1 string
function journal_c.setMapName(param1) end

---@param param1 string
function journal_c.setEmptyLogText(param1) end

function journal_c.updateWaypoints() end

---@param param1 number
---@param param2 string
function journal_c.addWaypoint(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
function journal_c.ping(param1, param2, param3) end

---@param param1 FlashObject
function journal_c.hidePing(param1) end

---@return FlashObject
function journal_c.getFreePingMC() end

---@param param1 number
function journal_c.getActivePing(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function journal_c.updatePing(param1, param2, param3) end

function journal_c.clearOldPings() end

---@param param1 string
function journal_c.setTrackedMarker(param1) end

---@class UIRoot_journal_csp: FlashObject @journal_csp
---@field journal_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip string
---@field hasTooltip boolean
---@field mapPosX number
---@field mapPosY number
---@field mapXY string
---@field mapScale number
---@field add_icons FlashArray
---@field add_dirs FlashArray
---@field charIconW number
---@field charIconH number
---@field iconWidth number
---@field iconHeight number
---@field questCompletedLabel string
---@field add_quest FlashArray
---@field add_subquest FlashArray
---@field add_questInfo FlashArray
---@field add_mystery FlashArray
---@field add_mysteryInfo FlashArray
---@field add_secret FlashArray
---@field add_secretInfo FlashArray
---@field add_recipes FlashArray
---@field add_dialog FlashArray
---@field add_tutEntry FlashArray
---@field pingPoolIdx number
---@field pingPool FlashArray
---@field activePings FlashArray
---@field selectedQuest FlashObject
---@field showPostponed boolean
---@field onMapBtnHintId number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field downEvent string
---@field add_dialogLine FlashArray
---@field add_combatLog FlashArray
---@field waypoint_array FlashArray
journal_csp = {}

function journal_csp.MainTimeline() end

---@param param1 string
function journal_csp.setPanelTitle(param1) end

function journal_csp.onEventInit() end

---@param param1 number
---@param param2 boolean
function journal_csp.setPlayer(param1, param2) end

---@param param1 boolean
function journal_csp.setMapLegendHidden(param1) end

---@param param1 number
function journal_csp.setAnchor(param1) end

function journal_csp.onEventResize() end

---@param param1 number
function journal_csp.onEventUp(param1) end

---@param param1 number
function journal_csp.onEventDown(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function journal_csp.addBtnHint(param1, param2, param3) end

function journal_csp.clearBtnHints() end

function journal_csp.clearSeenNewFlags() end

---@param param1 number
---@param param2 string
function journal_csp.setBtnTooltip(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
---@param param5 string
---@param param6 boolean
---@param param7 boolean
---@param param8 boolean
---@param param9 number
---@param param10 number
---@param param11 boolean
function journal_csp.addQuest(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) end

function journal_csp.clearQuests() end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
---@param param5 string
---@param param6 number
---@param param7 string
---@param param8 string
---@param param9 number
---@param param10 string
function journal_csp.addQuestInfo(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) end

---@param param1 string
---@param param2 number
---@param param3 string
---@param param4 string
function journal_csp.addTutorialEntry(param1, param2, param3, param4) end

function journal_csp.resetSelection() end

function journal_csp.clearTutorials() end

---@param param1 number
---@param param2 boolean
function journal_csp.showBreadcrumb(param1, param2) end

---@param param1 number
---@param param2 string
function journal_csp.addTab(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function journal_csp.addSubTab(param1, param2, param3) end

function journal_csp.clearDialogs() end

function journal_csp.updateDialogLogLines() end

---@param param1 number
---@param param2 string
function journal_csp.addCombatLogLine(param1, param2) end

function journal_csp.clearCombatLog() end

---@param param1 number
function journal_csp.selectTab(param1) end

function journal_csp.executeSelected() end

---@return FlashObject
function journal_csp.hideWin() end

---@return FlashObject
function journal_csp.showWin() end

---@return number
function journal_csp.getHeight() end

---@return number
function journal_csp.getWidth() end

---@param param1 number
---@return FlashObject
function journal_csp.setX(param1) end

---@param param1 number
---@return FlashObject
function journal_csp.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function journal_csp.setPos(param1, param2) end

---@return number
function journal_csp.getX() end

---@return number
function journal_csp.getY() end

function journal_csp.fadeIn() end

function journal_csp.fadeOut() end

---@param param1 number
---@param param2 string
function journal_csp.addSecret(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function journal_csp.addSecretInfo(param1, param2, param3) end

function journal_csp.clearRecipes() end

---@param param1 number
---@param param2 string
---@param param3 string
function journal_csp.addRecipe(param1, param2, param3) end

---@param param1 number
---@param param2 number
function journal_csp.setTrophyKills(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 string
---@param param5 number
---@param param6 string
function journal_csp.addTrophy(param1, param2, param3, param4, param5, param6) end

function journal_csp.update() end

function journal_csp.updateRecipes() end

---@param param1 string
function journal_csp.updateJournal(param1) end

function journal_csp.updateJournalInfo() end

function journal_csp.updateDialogLog() end

function journal_csp.updateCombatLog() end

function journal_csp.updateTutorials() end

function journal_csp.clearIcons() end

---@param param1 number
function journal_csp.trackIcon(param1) end

function journal_csp.clearTrackIcon() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 number
---@param param6 number
---@param param7 number
---@param param8 string
function journal_csp.setObjectIcon(param1, param2, param3, param4, param5, param6, param7, param8) end

---@param param1 number
function journal_csp.setMapScale(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 string
function journal_csp.setPlayerOnMap(param1, param2, param3, param4, param5, param6) end

---@param param1 number
function journal_csp.removePlayer(param1) end

---@param param1 number
---@param param2 number
function journal_csp.setMapSize(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 boolean
function journal_csp.setMapTitle(param1, param2, param3) end

---@param param1 number
---@param param2 string
function journal_csp.addLegend(param1, param2) end

function journal_csp.clearLegend() end

---@param param1 string
function journal_csp.setMapName(param1) end

---@param param1 string
function journal_csp.setEmptyLogText(param1) end

function journal_csp.updateWaypoints() end

---@param param1 number
---@param param2 string
function journal_csp.addWaypoint(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
function journal_csp.ping(param1, param2, param3) end

---@param param1 FlashObject
function journal_csp.hidePing(param1) end

---@return FlashObject
function journal_csp.getFreePingMC() end

---@param param1 number
function journal_csp.getActivePing(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function journal_csp.updatePing(param1, param2, param3) end

function journal_csp.clearOldPings() end

---@param param1 string
function journal_csp.setTrackedMarker(param1) end

---@class UIRoot_loadingScreen: FlashObject @loadingScreen
---@field errorText_txt FlashObject
---@field loadingScreen_mc FlashObject
---@field events FlashArray
---@field layout string
---@field buttonHints FlashArray
---@field circleTimeline FlashObject
---@field tf FlashObject
loadingScreen = {}

function loadingScreen.MainTimeline() end

---@param param1 number
---@param param2 number
function loadingScreen.onEventResolution(param1, param2) end

---@param param1 number
function loadingScreen.onEventUp(param1) end

function loadingScreen.onEventInit() end

---@param param1 number
function loadingScreen.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function loadingScreen.startsWith(param1, param2) end

---@param param1 string
function loadingScreen.addBackgroundImage(param1) end

---@param param1 string
function loadingScreen.setLoadingInfoText(param1) end

---@param param1 string
function loadingScreen.setTitle(param1) end

---@param param1 string
function loadingScreen.setLoadingStageText(param1) end

---@param param1 number
function loadingScreen.setBar1Progress(param1) end

function loadingScreen.fadeInCircle() end

function loadingScreen.fadeInCircle2() end

function loadingScreen.fadeInCircle3() end

function loadingScreen.stopCircleFade() end

---@param param1 number
function loadingScreen.setBar1Colour(param1) end

---@param param1 string
function loadingScreen.addDebugText(param1) end

---@param param1 string
function loadingScreen.setInfoText(param1) end

---@param param1 boolean
function loadingScreen.setControllerMode(param1) end

---@class UIRoot_LSClasses: FlashObject @LSClasses
---@field l FlashObject
---@field v42 FlashObject
LSClasses = {}

function LSClasses.MainTimeline() end

---@class UIRoot_mainMenu: FlashObject @mainMenu
---@field mainMenu_mc FlashObject
---@field splashScreen_mc FlashObject
---@field disabledSplashScreen boolean
---@field splashScreen boolean
---@field events FlashArray
---@field layout string
---@field btnHelper FlashObject
---@field timeSplashMove FlashObject
---@field closingSplash boolean
---@field splashTw FlashObject
---@field splashTextTw FlashObject
---@field mainATw FlashObject
---@field splashLogoTwA FlashObject
---@field splashLogoTwY FlashObject
mainMenu = {}

function mainMenu.MainTimeline() end

function mainMenu.onEventInit() end

function mainMenu.onEventResize() end

---@param param1 number
function mainMenu.setSelection(param1) end

---@param param1 number
function mainMenu.onEventUp(param1) end

---@param param1 number
function mainMenu.onEventDown(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function mainMenu.addMenuDropDown(param1, param2, param3) end

---@param param1 number
---@param param2 string
function mainMenu.addMenuDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 number
function mainMenu.selectMenuDropDownEntry(param1, param2) end

---@param param1 number
function mainMenu.selectDifficultyButton(param1) end

function mainMenu.openMenu() end

function mainMenu.closeMenu() end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 boolean
---@param param5 number
function mainMenu.addMenuButton(param1, param2, param3, param4, param5) end

---@param param1 string
function mainMenu.addProfileBox(param1) end

---@param param1 number
function mainMenu.addSpacing(param1) end

---@param param1 string
function mainMenu.addMenuLabel(param1) end

---@param param1 boolean
function mainMenu.setKickstarterBadgeVisible(param1) end

function mainMenu.executeSelected() end

---@param param1 boolean
function mainMenu.moveCursor(param1) end

function mainMenu.removeItems() end

---@param param1 number
function mainMenu.setDifficulityMode(param1) end

---@param param1 number
function mainMenu.addLoadingElements(param1) end

---@param param1 number
function mainMenu.removeLoadingElements(param1) end

function mainMenu.clearLoadingElements() end

---@param param1 number
function mainMenu.setBeginButtonID(param1) end

---@return FlashObject
function mainMenu.hideWin() end

---@return FlashObject
function mainMenu.showWin() end

---@return number
function mainMenu.getHeight() end

---@return number
function mainMenu.getWidth() end

---@param param1 number
---@return FlashObject
function mainMenu.setX(param1) end

---@param param1 number
---@return FlashObject
function mainMenu.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function mainMenu.setPos(param1, param2) end

---@return number
function mainMenu.getX() end

---@return number
function mainMenu.getY() end

---@param param1 boolean
function mainMenu.setBGVisible(param1) end

---@param param1 string
---@return FlashObject
function mainMenu.setDebugText(param1) end

---@param param1 string
---@return FlashObject
function mainMenu.setCopyrightText(param1) end

---@param param1 string
function mainMenu.setMenuTitle(param1) end

---@param param1 string
function mainMenu.setSplashSingleText(param1) end

---@param param1 string
---@param param2 string
function mainMenu.setSplashText(param1, param2) end

function mainMenu.hideSplashButtonHint() end

function mainMenu.showSplashButtonHint() end

function mainMenu.closeSplashScreen() end

function mainMenu.openSplashScreen() end

function mainMenu.sendOpenCallback() end

---@param param1 FlashObject
function mainMenu.sendCallback(param1) end

function mainMenu.disableSplash() end

function mainMenu.stopTweens() end

---@param param1 boolean
function mainMenu.setSplashVisible(param1) end

function mainMenu.afterSplashClosed() end

---@class UIRoot_mainMenu_c: FlashObject @mainMenu_c
---@field mainMenu_mc FlashObject
---@field splashScreen_mc FlashObject
---@field btnHelper FlashObject
---@field joinBtnHelper FlashObject
---@field joinIconSize number
---@field events FlashArray
---@field layout string
---@field disabledSplashScreen boolean
---@field splashScreen boolean
---@field profilesOffset number
---@field timeSplashMove FlashObject
---@field closingSplash boolean
---@field splashTw FlashObject
---@field splashTextTw FlashObject
---@field mainATw FlashObject
---@field splashLogoTwA FlashObject
---@field splashLogoTwY FlashObject
---@field splashText2Tw FlashObject
---@field splashText3Tw FlashObject
---@field splashBtnTw FlashObject
mainMenu_c = {}

function mainMenu_c.MainTimeline() end

function mainMenu_c.onEventInit() end

function mainMenu_c.onEventResize() end

---@param param1 number
function mainMenu_c.setSelection(param1) end

---@param param1 number
function mainMenu_c.onEventUp(param1) end

---@param param1 number
function mainMenu_c.onEventDown(param1) end

---@param param1 number
function mainMenu_c.addSpacing(param1) end

---@param param1 number
function mainMenu_c.setBeginButtonID(param1) end

function mainMenu_c.openMenu() end

function mainMenu_c.closeMenu() end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 boolean
---@param param5 number
function mainMenu_c.addMenuButton(param1, param2, param3, param4, param5) end

---@param param1 boolean
function mainMenu_c.setKickstarterBadgeVisible(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function mainMenu_c.addBtnHint(param1, param2, param3) end

function mainMenu_c.clearBtnHints() end

---@param param1 string
function mainMenu_c.addMenuLabel(param1) end

function mainMenu_c.executeSelected() end

---@param param1 boolean
function mainMenu_c.moveCursor(param1) end

function mainMenu_c.removeItems() end

---@param param1 number
function mainMenu_c.setDifficulityMode(param1) end

---@param param1 number
function mainMenu_c.addLoadingElements(param1) end

---@param param1 number
function mainMenu_c.removeLoadingElements(param1) end

function mainMenu_c.clearLoadingElements() end

function mainMenu_c.hideHintsAndCopyright() end

---@return FlashObject
function mainMenu_c.hideWin() end

---@return FlashObject
function mainMenu_c.showWin() end

---@return number
function mainMenu_c.getHeight() end

---@return number
function mainMenu_c.getWidth() end

---@param param1 number
---@return FlashObject
function mainMenu_c.setX(param1) end

---@param param1 number
---@return FlashObject
function mainMenu_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function mainMenu_c.setPos(param1, param2) end

---@return number
function mainMenu_c.getX() end

---@return number
function mainMenu_c.getY() end

---@param param1 boolean
function mainMenu_c.setBGVisible(param1) end

---@param param1 string
---@return FlashObject
function mainMenu_c.setDebugText(param1) end

---@param param1 string
---@return FlashObject
function mainMenu_c.setCopyrightText(param1) end

---@param param1 boolean
function mainMenu_c.allowChange(param1) end

---@param param1 string
---@param param2 string
---@param param3 number
---@param param4 string
function mainMenu_c.setProfile(param1, param2, param3, param4) end

---@param param1 string
function mainMenu_c.setPressToJoin(param1) end

---@param param1 string
---@param param2 string
function mainMenu_c.setProfileP2(param1, param2) end

---@param param1 string
function mainMenu_c.setMenuTitle(param1) end

---@param param1 string
function mainMenu_c.setSplashSingleText(param1) end

---@param param1 boolean
function mainMenu_c.showLoadingIcon(param1) end

---@param param1 boolean
---@param param2 number
function mainMenu_c.showDifficultyIcon(param1, param2) end

---@param param1 string
---@param param2 string
function mainMenu_c.setSplashText(param1, param2) end

function mainMenu_c.hideSplashButtonHint() end

function mainMenu_c.showSplashButtonHint() end

---@param param1 number
function mainMenu_c.selectDifficultyButton(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function mainMenu_c.addMenuDropDown(param1, param2, param3) end

---@param param1 number
---@param param2 string
function mainMenu_c.addMenuDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 number
function mainMenu_c.selectMenuDropDownEntry(param1, param2) end

function mainMenu_c.stopTweens() end

function mainMenu_c.closeSplashScreen() end

---@param param1 boolean
function mainMenu_c.openSplashScreen(param1) end

---@param param1 boolean
function mainMenu_c.setSplashVisible(param1) end

function mainMenu_c.sendOpenCallback() end

---@param param1 FlashObject
function mainMenu_c.sendCallback(param1) end

function mainMenu_c.disableSplash() end

function mainMenu_c.afterSplashClosed() end

---@class UIRoot_menuBG: FlashObject @menuBG
---@field events FlashArray
---@field layout string
menuBG = {}

function menuBG.MainTimeline() end

function menuBG.onEventInit() end

function menuBG.onEventResize() end

---@param param1 number
function menuBG.onEventUp(param1) end

---@param param1 number
function menuBG.onEventDown(param1) end

---@class UIRoot_minimap: FlashObject @minimap
---@field armourDoll_mc FlashObject
---@field diplomacy_mc FlashObject
---@field hackIcon_mc FlashObject
---@field hit_mc FlashObject
---@field homestead_mc FlashObject
---@field map_mc FlashObject
---@field north_mc FlashObject
---@field pingButton_mc FlashObject
---@field tensionHit_mc FlashObject
---@field tension_mc FlashObject
---@field title_txt FlashObject
---@field uiScaling number
---@field events FlashArray
---@field layout string
---@field frame_width number
---@field frame_height number
---@field add_icons FlashArray
---@field add_dirs FlashArray
---@field trackedIcons FlashArray
---@field charIconPos FlashArray
---@field charIconDir FlashArray
---@field armorDollX number
---@field armorDollY number
---@field pingPoolIdx number
---@field pingPool FlashArray
---@field isMouseOverMap boolean
---@field activePings FlashArray
---@field homesteadTutX number
---@field homesteadTutY number
---@field _pingModeEnabled boolean
---@field btnAction_array FlashArray
minimap = {}

function minimap.MainTimeline() end

---@param param1 FlashObject
function minimap.isOverUI(param1) end

---@param param1 FlashObject
function minimap.isOutUI(param1) end

function minimap.updateScale() end

---@param param1 number
---@param param2 number
function minimap.setMapSize(param1, param2) end

function minimap.onMapMouseDown() end

function minimap.onPingButtonPressed() end

function minimap.onPingButtonOver() end

function minimap.onPingButtonOut() end

function minimap.onEventInit() end

function minimap.diplomacyPressed() end

---@param param1 boolean
function minimap.setArmourDollVisible(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 number
function minimap.setArmourDollStates(param1, param2, param3, param4, param5, param6, param7) end

---@param param1 string
function minimap.setBuildText(param1) end

---@param param1 number
function minimap.setCurrentPlayerRotation(param1) end

---@param param1 number
function minimap.setNorthRotation(param1) end

---@param param1 string
function minimap.setMapText(param1) end

function minimap.clearIcons() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 boolean
function minimap.setObjectIcon(param1, param2, param3, param4, param5, param6, param7) end

function minimap.clearDirections() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 boolean
function minimap.setDirectionMarker(param1, param2, param3, param4, param5) end

---@param param1 number
function minimap.setMapScale(param1) end

function minimap.startHomeSteadAttention() end

function minimap.stopHomeSteadAttention() end

---@param param1 number
function minimap.setHomeSteadBtnState(param1) end

---@param param1 number
---@param param2 string
function minimap.setBtnTooltip(param1, param2) end

---@param param1 string
function minimap.setTensionGemTooltip(param1) end

---@param param1 number
---@param param2 boolean
function minimap.setBtnDisabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function minimap.setBtnVisible(param1, param2) end

---@param param1 boolean
function minimap.showMiniMap(param1) end

---@param param1 boolean
function minimap.update(param1) end

---@param param1 number
function minimap.isTracked(param1) end

---@param param1 boolean
function minimap.updateDirectionMarkers(param1) end

---@param param1 number
---@param param2 number
function minimap.setMapOffset(param1, param2) end

---@param param1 FlashObject
function minimap.showTooltipForMC(param1) end

---@param param1 FlashObject
---@return FlashObject
function minimap.getGlobalPositionOfMC(param1) end

---@param param1 number
---@param param2 boolean
function minimap.setTensionLevel(param1, param2) end

---@param param1 number
---@return FlashObject
function minimap.createPing(param1) end

---@param param1 FlashObject
function minimap.hidePing(param1) end

---@return FlashObject
function minimap.getFreePingMC() end

---@param param1 number
function minimap.getActivePing(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function minimap.updatePing(param1, param2, param3) end

---@param param1 number
function minimap.onEventDown(param1) end

function minimap.togglePingMode() end

function minimap.disablePingMode() end

---@param param1 FlashObject
function minimap.clampPingPosition(param1) end

---@class UIRoot_minimap_c: FlashObject @minimap_c
---@field chatInfo_mc FlashObject
---@field map_mc FlashObject
---@field title_txt FlashObject
---@field uiScaling number
---@field events FlashArray
---@field layout string
---@field leftUI boolean
---@field frame_width number
---@field frame_height number
---@field add_icons FlashArray
---@field add_dirs FlashArray
---@field trackedIcons FlashArray
---@field charIconPos FlashArray
---@field charIconDir FlashArray
---@field pingPoolIdx number
---@field pingPool FlashArray
---@field activePings FlashArray
minimap_c = {}

function minimap_c.MainTimeline() end

---@param param1 number
---@param param2 number
function minimap_c.setWindow(param1, param2) end

---@param param1 number
---@param param2 number
function minimap_c.setMapSize(param1, param2) end

function minimap_c.onEventInit() end

---@param param1 boolean
function minimap_c.setChatIconVisible(param1) end

---@param param1 number
function minimap_c.setAnchor(param1) end

---@param param1 number
function minimap_c.setAmountOfPlayers(param1) end

---@param param1 string
function minimap_c.setBuildText(param1) end

function minimap_c.onEventResize() end

---@param param1 number
---@param param2 boolean
function minimap_c.setTensionLevel(param1, param2) end

---@param param1 number
function minimap_c.setCurrentPlayerRotation(param1) end

---@param param1 number
function minimap_c.setNorthRotation(param1) end

---@param param1 string
function minimap_c.setMapText(param1) end

function minimap_c.clearIcons() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 boolean
function minimap_c.setObjectIcon(param1, param2, param3, param4, param5, param6) end

function minimap_c.clearDirections() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 boolean
function minimap_c.setDirectionMarker(param1, param2, param3, param4, param5) end

---@param param1 number
function minimap_c.setMapScale(param1) end

---@param param1 boolean
function minimap_c.update(param1) end

---@param param1 boolean
function minimap_c.updateDirectionMarkers(param1) end

---@param param1 number
function minimap_c.isTracked(param1) end

---@param param1 number
---@return FlashObject
function minimap_c.createPing(param1) end

---@param param1 FlashObject
function minimap_c.hidePing(param1) end

---@return FlashObject
function minimap_c.getFreePingMC() end

---@param param1 number
function minimap_c.getActivePing(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
function minimap_c.updatePing(param1, param2, param3) end

---@param param1 FlashObject
function minimap_c.clampPingPosition(param1) end

---@param param1 number
---@param param2 number
function minimap_c.setMapOffset(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function minimap_c.getGlobalPositionOfMC(param1) end

---@param param1 boolean
function minimap_c.showMiniMap(param1) end

---@class UIRoot_mods: FlashObject @mods
---@field mods_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field _selectedTab number
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
mods = {}

function mods.MainTimeline() end

function mods.onEventInit() end

function mods.onEventResize() end

---@param param1 number
---@return boolean
function mods.onEventUp(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function mods.startsWith(param1, param2) end

---@param param1 number
---@return boolean
function mods.onEventDown(param1) end

function mods.fadeIn() end

function mods.fadeOut() end

function mods.slideIn() end

function mods.requestClose() end

function mods.requestHide() end

function mods.requestDestroy() end

---@param param1 number
---@param param2 boolean
function mods.moveAddon(param1, param2) end

---@param param1 number
---@param param2 string
function mods.setText(param1, param2) end

---@param param1 string
function mods.setModNotice(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 boolean
function mods.addAlterMod(param1, param2, param3, param4, param5) end

function mods.sortAlterModList() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function mods.addCampaign(param1, param2, param3) end

---@param param1 number
function mods.selectMainMod(param1) end

function mods.clearMods() end

---@param param1 number
---@param param2 string
function mods.setBtnText(param1, param2) end

---@param param1 number
---@param param2 boolean
function mods.setBtnDisabled(param1, param2) end

---@param param1 number
---@param param2 string
function mods.addTab(param1, param2) end

---@param param1 number
---@param param2 boolean
function mods.setTabEnabled(param1, param2) end

function mods.resetAll() end

---@class UIRoot_mods_c: FlashObject @mods_c
---@field mods_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timelineA FlashObject
---@field timelineY FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field TweenDuration number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field events FlashArray
---@field layout string
---@field lbPos number
---@field rbPos number
mods_c = {}

function mods_c.MainTimeline() end

function mods_c.onEventInit() end

function mods_c.onEventResize() end

---@param param1 number
---@return boolean
function mods_c.onEventUp(param1) end

---@param param1 number
---@return boolean
function mods_c.onEventDown(param1) end

function mods_c.next() end

function mods_c.previous() end

function mods_c.nextMainMode() end

function mods_c.previousMainMode() end

---@param param1 number
---@param param2 string
function mods_c.addTab(param1, param2) end

---@param param1 number
---@param param2 boolean
function mods_c.setTabEnabled(param1, param2) end

function mods_c.upAdditionalMode() end

function mods_c.downAdditionalMode() end

---@param param1 string
---@param param2 string
---@return boolean
function mods_c.startsWith(param1, param2) end

function mods_c.fadeIn() end

function mods_c.fadeOut() end

function mods_c.slideIn() end

function mods_c.requestClose() end

function mods_c.requestHide() end

function mods_c.requestDestroy() end

---@param param1 string
function mods_c.showModTooltip(param1) end

---@param param1 number
---@param param2 string
function mods_c.setText(param1, param2) end

---@param param1 string
function mods_c.setModNotice(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 boolean
function mods_c.addAlterMod(param1, param2, param3, param4, param5) end

function mods_c.sortAlterModList() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function mods_c.addCampaign(param1, param2, param3) end

function mods_c.clearMods() end

---@param param1 number
---@param param2 string
---@param param3 number
function mods_c.addBtnHint(param1, param2, param3) end

function mods_c.clearBtnHints() end

---@param param1 number
---@param param2 string
function mods_c.setBtnText(param1, param2) end

---@param param1 number
---@param param2 boolean
function mods_c.setBtnDisabled(param1, param2) end

---@class UIRoot_mouseIcon: FlashObject @mouseIcon
---@field mf_mc FlashObject
---@field events FlashArray
---@field layout string
---@field cellSize number
mouseIcon = {}

function mouseIcon.MainTimeline() end

function mouseIcon.onEventResize() end

---@param param1 number
function mouseIcon.onEventUp(param1) end

function mouseIcon.onEventInit() end

---@param param1 number
function mouseIcon.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function mouseIcon.startsWith(param1, param2) end

---@param param1 string
function mouseIcon.setTexture(param1) end

---@param param1 boolean
function mouseIcon.setCrossVisible(param1) end

---@param param1 boolean
function mouseIcon.setVisible(param1) end

---@class UIRoot_msgbox: FlashObject @msgbox
---@field popup_mc FlashObject
---@field CloseTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isOkCancel boolean
---@field isShared boolean
---@field hasTooltip boolean
---@field allowCancel boolean
---@field downInput string
---@field currentDevice number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
msgbox = {}

function msgbox.MainTimeline() end

function msgbox.onEventResize() end

---@param param1 number
---@return boolean
function msgbox.onEventUp(param1) end

---@param param1 number
---@return boolean
function msgbox.onEventDown(param1) end

---@param param1 boolean
function msgbox.setWaiting(param1) end

---@param param1 number
function msgbox.setInputDevice(param1) end

function msgbox.onEventInit() end

---@param param1 number
---@param param3 string
function msgbox.setAnchor(param1, param3) end

---@return FlashObject
function msgbox.hideWin() end

---@return FlashObject
function msgbox.showWin() end

---@return number
function msgbox.getHeight() end

---@return number
function msgbox.getWidth() end

---@param param1 number
---@return FlashObject
function msgbox.setX(param1) end

---@param param1 number
---@return FlashObject
function msgbox.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function msgbox.setPos(param1, param2) end

---@return number
function msgbox.getX() end

---@return number
function msgbox.getY() end

---@param param1 string
---@param param2 string
function msgbox.showPopup(param1, param2) end

---@param param1 string
function msgbox.setText(param1) end

function msgbox.showMsgbox() end

---@param param1 number
---@param param2 string
function msgbox.setTooltip(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 string
function msgbox.addButton(param1, param2, param3, param4) end

---@param param1 number
---@param param2 string
function msgbox.addBlueButton(param1, param2) end

---@param param1 number
function msgbox.addNoButton(param1) end

---@param param1 number
function msgbox.addYesButton(param1) end

function msgbox.removeButtons() end

---@param param1 boolean
function msgbox.setCopyBtnVisible(param1) end

---@param param1 boolean
function msgbox.setPasteBtnVisible(param1) end

function msgbox.fadeIn() end

function msgbox.fadeOut() end

---@param param1 boolean
---@param param2 number
---@param param3 number
function msgbox.setInputEnabled(param1, param2, param3) end

---@param param1 number
function msgbox.setPopupType(param1) end

function msgbox.focusInputEnabled() end

---@param param1 string
function msgbox.setInputText(param1) end

function msgbox.getInputText() end

function msgbox.clearBtnHints() end

function msgbox.addBtnHint() end

---@class UIRoot_msgBox_c: FlashObject @msgBox_c
---@field popup_mc FlashObject
---@field CloseTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field downInput string
---@field currentDevice number
---@field isShared boolean
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
msgBox_c = {}

function msgBox_c.MainTimeline() end

function msgBox_c.onEventResize() end

---@param param1 number
---@return boolean
function msgBox_c.onEventUp(param1) end

---@param param1 number
---@return boolean
function msgBox_c.onEventDown(param1) end

---@param param1 boolean
function msgBox_c.setWaiting(param1) end

---@param param1 number
function msgBox_c.setInputDevice(param1) end

function msgBox_c.showMsgbox() end

---@param param1 number
function msgBox_c.setPopupType(param1) end

function msgBox_c.onEventInit() end

---@param param1 number
---@param param3 string
function msgBox_c.setAnchor(param1, param3) end

---@return FlashObject
function msgBox_c.hideWin() end

---@return FlashObject
function msgBox_c.showWin() end

---@return number
function msgBox_c.getHeight() end

---@return number
function msgBox_c.getWidth() end

---@param param1 number
---@return FlashObject
function msgBox_c.setX(param1) end

---@param param1 number
---@return FlashObject
function msgBox_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function msgBox_c.setPos(param1, param2) end

---@return number
function msgBox_c.getX() end

---@return number
function msgBox_c.getY() end

---@param param1 string
---@param param2 string
function msgBox_c.showPopup(param1, param2) end

---@param param1 string
function msgBox_c.setText(param1) end

---@param param1 number
---@param param2 string
function msgBox_c.setTooltip(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function msgBox_c.addBtnHint(param1, param2, param3, param4) end

function msgBox_c.clearBtnHints() end

---@param param1 boolean
function msgBox_c.setCopyBtnVisible(param1) end

---@param param1 boolean
function msgBox_c.setPasteBtnVisible(param1) end

function msgBox_c.changeInputTextPos() end

function msgBox_c.fadeIn() end

function msgBox_c.fadeOut() end

---@param param1 boolean
---@param param2 number
---@param param3 number
function msgBox_c.setInputEnabled(param1, param2, param3) end

function msgBox_c.focusInputEnabled() end

---@param param1 string
function msgBox_c.setInputText(param1) end

function msgBox_c.getInputText() end

---@class UIRoot_notification: FlashObject @notification
---@field fightBanner_mc FlashObject
---@field notCast_mc FlashObject
---@field not_mc FlashObject
---@field regionBanner_mc FlashObject
---@field events FlashArray
---@field layout string
---@field deadlineTimer FlashObject
---@field isController boolean
---@field newSkill_mc FlashObject
---@field fadeTime number
---@field regionFadeOutTime number
---@field showTime number
---@field showFightTime number
---@field beginY number
---@field endY number
---@field beginRegionY number
---@field endRegionY number
---@field regionTween FlashObject
---@field regionTweenY FlashObject
---@field beginFightY number
---@field fightDelayTimer FlashObject
---@field fightTweenA FlashObject
---@field fightTweenB FlashObject
---@field fightTweenC FlashObject
---@field notCastFadeInTime number
---@field notCastFadeOutTime number
---@field notCastTween FlashObject
notification = {}

function notification.MainTimeline() end

---@param param1 number
function notification.useCleanUpTimer(param1) end

---@param param1 FlashObject
function notification.deadLineHit(param1) end

---@param param1 number
function notification.setAnchor(param1) end

---@param param1 boolean
function notification.setShared(param1) end

function notification.onEventResize() end

---@param param1 number
function notification.onEventUp(param1) end

---@param param1 number
function notification.onEventDown(param1) end

---@param param1 boolean
function notification.setControllerMode(param1) end

function notification.onEventInit() end

---@param param1 number
---@param param2 string
function notification.setLabel(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 string
function notification.showNewSkill(param1, param2, param3) end

---@param param1 string
---@param param2 string
function notification.showNewAbility(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 number
---@param param4 boolean
---@param param5 number
function notification.setNotification(param1, param2, param3, param4, param5) end

---@param param1 boolean
function notification.hideNotification(param1) end

---@param param1 FlashObject
function notification.startNotificationTween(param1) end

---@param param1 FlashObject
function notification.startHiding(param1) end

---@param param1 FlashObject
function notification.hideHPMC(param1) end

---@param param1 string
---@param param2 number
function notification.setRegionText(param1, param2) end

function notification.startRegionHiding() end

function notification.hideRegionMC() end

---@param param1 string
---@param param2 number
function notification.setFightText(param1, param2) end

function notification.startFightHiding() end

---@param param1 FlashObject
function notification.fightTimerDone(param1) end

function notification.hideFightMC() end

---@param param1 string
---@param param2 number
---@param param3 number
function notification.showCastNot(param1, param2, param3) end

function notification.hidingCastNot() end

function notification.INTNotificationDone() end

---@param param1 number
function notification.hideCastNot(param1) end

---@class UIRoot_npcInfo: FlashObject @npcInfo
---@field stats_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field events FlashArray
---@field layout string
npcInfo = {}

function npcInfo.MainTimeline() end

function npcInfo.onEventInit() end

function npcInfo.onEventResize() end

---@param param1 number
---@return boolean
function npcInfo.onEventUp(param1) end

function npcInfo.next() end

function npcInfo.previous() end

---@param param1 string
---@param param2 string
---@return boolean
function npcInfo.startsWith(param1, param2) end

---@param param1 number
---@return boolean
function npcInfo.onEventDown(param1) end

function npcInfo.fadeIn() end

function npcInfo.fadeOut() end

function npcInfo.slideIn() end

function npcInfo.requestClose() end

function npcInfo.requestHide() end

function npcInfo.requestDestroy() end

---@param param1 number
---@param param2 string
function npcInfo.setText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 string
function npcInfo.addStat(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 string
function npcInfo.addStatWIcon(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 string
function npcInfo.addStatus(param1, param2, param3, param4) end

---@param param1 number
function npcInfo.addDivider(param1) end

function npcInfo.sortList() end

function npcInfo.clearAll() end

---@param param1 FlashObject
---@return FlashObject
function npcInfo.getGlobalPositionOfMC(param1) end

---@param param1 FlashObject
---@param param2 string
function npcInfo.showTooltipForMC(param1, param2) end

---@class UIRoot_optionsInput: FlashObject @optionsInput
---@field controlsMenu_mc FlashObject
---@field events FlashArray
---@field layout string
---@field timelineCloseMenu FlashObject
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field assignState boolean
---@field buttons_Array FlashArray
---@field button_array FlashArray
optionsInput = {}

function optionsInput.MainTimeline() end

function optionsInput.onEventResize() end

---@param param1 number
---@return boolean
function optionsInput.onEventUp(param1) end

function optionsInput.onEventInit() end

---@param param1 number
---@return boolean
function optionsInput.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function optionsInput.startsWith(param1, param2) end

function optionsInput.addMenuButtons() end

function optionsInput.resetMenuButtons() end

---@param param1 number
---@param param2 string
function optionsInput.addTab(param1, param2) end

---@param param1 number
function optionsInput.addLine(param1) end

---@param param1 string
function optionsInput.setTitle(param1) end

---@param param1 string
function optionsInput.setTopTitle(param1) end

function optionsInput.closeMenu() end

function optionsInput.requestClose() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 string
function optionsInput.addEntry(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 string
function optionsInput.addTitle(param1, param2) end

function optionsInput.removeContent() end

---@param param1 string
function optionsInput.changeOverlayText(param1) end

---@param param1 number
function optionsInput.selectContent(param1) end

---@param param1 number
function optionsInput.selectTab(param1) end

function optionsInput.selectNext() end

function optionsInput.selectPrevious() end

function optionsInput.changeCurrentButton() end

---@param param1 number
---@param param2 number
function optionsInput.changeButton(param1, param2) end

function optionsInput.cancelInputChange() end

function optionsInput.hideOverlay() end

---@param param1 string
---@param param2 string
---@param param3 string
function optionsInput.setMenuTexts(param1, param2, param3) end

function optionsInput.showOverlay() end

---@param param1 number
---@param param2 number
---@param param3 string
function optionsInput.setInput(param1, param2, param3) end

---@param param1 number
---@param param2 string
function optionsInput.setCurrentInput(param1, param2) end

---@param param1 number
---@param param2 string
function optionsInput.setButtonText(param1, param2) end

---@param param1 number
---@param param2 boolean
function optionsInput.setButtonDisable(param1, param2) end

function optionsInput.initDone() end

---@class UIRoot_optionsSettings: FlashObject @optionsSettings
---@field mainMenu_mc FlashObject
---@field selectedInfo_txt FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip string
---@field hasTooltip boolean
---@field ElW number
---@field update_Array FlashArray
---@field baseUpdate_Array FlashArray
---@field button_array FlashArray
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
optionsSettings = {}

function optionsSettings.MainTimeline() end

function optionsSettings.onEventInit() end

function optionsSettings.parseUpdateArray() end

function optionsSettings.parseBaseUpdateArray() end

function optionsSettings.onEventResize() end

---@param param1 number
---@return boolean
function optionsSettings.onEventUp(param1) end

---@param param1 number
---@return boolean
function optionsSettings.onEventDown(param1) end

---@return FlashObject
function optionsSettings.hideWin() end

---@return FlashObject
function optionsSettings.showWin() end

---@return number
function optionsSettings.getHeight() end

---@return number
function optionsSettings.getWidth() end

---@param param1 number
---@return FlashObject
function optionsSettings.setX(param1) end

---@param param1 number
---@return FlashObject
function optionsSettings.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function optionsSettings.setPos(param1, param2) end

---@return number
function optionsSettings.getX() end

---@return number
function optionsSettings.getY() end

function optionsSettings.openMenu() end

function optionsSettings.closeMenu() end

---@param param1 number
---@param param2 string
---@param param3 string
function optionsSettings.addMenuInfoLabel(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
---@param param3 number
function optionsSettings.setMenuCheckbox(param1, param2, param3) end

---@param param1 number
---@param param2 string
function optionsSettings.addMenuSelector(param1, param2) end

---@param param1 number
---@param param2 string
function optionsSettings.addMenuSelectorEntry(param1, param2) end

---@param param1 number
---@param param2 number
function optionsSettings.selectMenuDropDownEntry(param1, param2) end

---@param param1 number
function optionsSettings.clearMenuDropDownEntries(param1) end

---@param param1 number
---@param param2 boolean
function optionsSettings.setMenuDropDownEnabled(param1, param2) end

---@param param1 number
---@param param2 string
function optionsSettings.setMenuDropDownDisabledTooltip(param1, param2) end

---@param param1 number
---@param param2 number
function optionsSettings.setMenuSlider(param1, param2) end

---@param param1 string
---@param param2 string
---@param param3 FlashObject
---@param param4 boolean
function optionsSettings.addOptionButton(param1, param2, param3, param4) end

---@param param1 number
---@param param2 boolean
function optionsSettings.setButtonEnabled(param1, param2) end

function optionsSettings.removeItems() end

---@class UIRoot_optionsSettings_c: FlashObject @optionsSettings_c
---@field mainMenu_mc FlashObject
---@field selectedInfo_txt FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip string
---@field hasTooltip boolean
---@field update_Array FlashArray
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
optionsSettings_c = {}

function optionsSettings_c.MainTimeline() end

function optionsSettings_c.onEventInit() end

function optionsSettings_c.onEventResize() end

---@param param1 number
---@return boolean
function optionsSettings_c.onEventUp(param1) end

function optionsSettings_c.addingDone() end

---@param param1 string
function optionsSettings_c.addCheckBoxOptions(param1) end

---@param param1 number
---@return boolean
function optionsSettings_c.onEventDown(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function optionsSettings_c.addBtnHint(param1, param2, param3) end

function optionsSettings_c.clearBtnHints() end

---@return FlashObject
function optionsSettings_c.hideWin() end

---@return FlashObject
function optionsSettings_c.showWin() end

---@return number
function optionsSettings_c.getHeight() end

---@return number
function optionsSettings_c.getWidth() end

---@param param1 number
---@return FlashObject
function optionsSettings_c.setX(param1) end

---@param param1 number
---@return FlashObject
function optionsSettings_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function optionsSettings_c.setPos(param1, param2) end

---@return number
function optionsSettings_c.getX() end

---@return number
function optionsSettings_c.getY() end

function optionsSettings_c.openMenu() end

function optionsSettings_c.closeMenu() end

---@param param1 string
function optionsSettings_c.addMenuLabel(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function optionsSettings_c.addMenuInfoLabel(param1, param2, param3) end

---@param param1 string
function optionsSettings_c.setTitle(param1) end

---@param param1 string
function optionsSettings_c.setTopTitle(param1) end

function optionsSettings_c.parseUpdateArray() end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 number
---@param param5 boolean
---@param param6 string
function optionsSettings_c.addMenuCheckbox(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 boolean
---@param param3 number
function optionsSettings_c.setMenuCheckbox(param1, param2, param3) end

---@param param1 number
---@param param2 string
function optionsSettings_c.addMenuSelector(param1, param2) end

---@param param1 number
---@param param2 string
function optionsSettings_c.addMenuSelectorEntry(param1, param2) end

---@param param1 number
---@param param2 number
function optionsSettings_c.selectMenuSelectorEntry(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
function optionsSettings_c.addMenuDropDown(param1, param2, param3) end

---@param param1 number
---@param param2 string
function optionsSettings_c.addMenuDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 number
function optionsSettings_c.selectMenuDropDownEntry(param1, param2) end

---@param param1 number
function optionsSettings_c.clearMenuDropDownEntries(param1) end

---@param param1 number
---@param param2 boolean
function optionsSettings_c.setMenuDropDownEnabled(param1, param2) end

---@param param1 number
---@param param2 string
function optionsSettings_c.setMenuDropDownDisabledTooltip(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 boolean
---@param param8 string
function optionsSettings_c.addMenuSlider(param1, param2, param3, param4, param5, param6, param7, param8) end

---@param param1 number
---@param param2 number
function optionsSettings_c.setMenuSlider(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 boolean
function optionsSettings_c.addMenuButton(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
function optionsSettings_c.setButtonEnabled(param1, param2) end

---@param param1 number
---@param param2 string
function optionsSettings_c.setButtonText(param1, param2) end

function optionsSettings_c.removeItems() end

---@class UIRoot_overhead: FlashObject @overhead
---@field charHolder_mc FlashObject
---@field events FlashArray
---@field layout string
---@field overhead_array FlashArray
---@field addOH_array FlashArray
---@field selectionInfo_array FlashArray
---@field status_array FlashArray
---@field hpBarToUpdate_array FlashArray
---@field hp_array FlashArray
---@field OHXtraOffset number
---@field APString string
---@field NAPString string
---@field characterHolderCache FlashArray
---@field maxCharacterHolderCache number
---@field tEffQuality number
---@field tEffQualityDam number
---@field tEffStr number
---@field tEffStrW number
---@field tEffStrWDam number
---@field tweenTime number
---@field ohTweenBubbleTime number
---@field ohTweenMoveUpTime number
---@field ohTweenInTime number
---@field CH_array FlashArray
---@field overheadSize number
---@field anchorPlayerId number
---@field OHOffset number
overhead = {}

function overhead.MainTimeline() end

---@param param1 string
function overhead.setOverheadSize(param1) end

---@param param1 number
function overhead.onEventUp(param1) end

---@param param1 number
function overhead.onEventDown(param1) end

function overhead.onEventResize() end

function overhead.onEventInit() end

---@param param1 number
function overhead.setAnchor(param1) end

---@param param1 FlashObject
function overhead.reorderTexts(param1) end

---@param param1 FlashObject
function overhead.reorderAllTexts(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function overhead.addOverhead(param1, param2, param3) end

---@param param1 number
---@param param2 string
function overhead.addOverheadDamage(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
function overhead.addADialog(param1, param2, param3) end

---@param param1 FlashObject
function overhead.repositionHolders(param1) end

---@param param1 string
---@param param2 string
function overhead.setAPString(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 number
---@param param8 number
---@param param9 number
---@param param10 number
---@param param11 string
---@param param12 string
---@param param13 string
---@param param14 string
---@param param15 boolean
---@param param16 boolean
---@param param17 string
---@param param18 string
---@param param19 boolean
---@param param20 number
---@param param21 boolean
function overhead.addOverheadSelectionInfo(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11, param12, param13, param14, param15, param16, param17, param18, param19, param20, param21) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function overhead.clearOverheadSelectionInfo(param1, param2, param3) end

---@param param1 number
function overhead.clearAllOverheadSelectionInfos(param1) end

function overhead.updateOHs() end

function overhead.cleanUpAllStatusses() end

---@param param1 boolean
function overhead.updateStatusses(param1) end

---@param param1 boolean
---@param param2 FlashObject
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
function overhead.setStatus(param1, param2, param3, param4, param5, param6) end

---@param param1 FlashObject
function overhead.cleanupStatuses(param1) end

---@param param1 FlashObject
---@param param2 string
function overhead.setIggyImage(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function overhead.removeChildrenOf(param1) end

---@return number
function overhead.getCharHolderIndex() end

---@param param1 number
---@param param2 boolean
---@param param3 boolean
---@return FlashObject
function overhead.getCharHolder(param1, param2, param3) end

---@return FlashObject
function overhead.INTnewCharacterHolder() end

---@param param1 number
---@return FlashObject
function overhead.newCharacterHolder(param1) end

---@param param1 number
function overhead.clearAD(param1) end

---@param param1 FlashObject
function overhead.INTclearAD(param1) end

---@param param1 FlashObject
---@return number
function overhead.getOHOffset(param1) end

function overhead.clearObsoleteOHTs() end

---@param param1 number
---@param param2 FlashArray
---@return number
function overhead.findInArray(param1, param2) end

---@param param1 FlashObject
function overhead.removeCharHolderInt(param1) end

---@param param1 FlashObject
function overhead.tryToPutBackInCache(param1) end

---@param param1 FlashArray
---@param param2 number
---@return FlashObject
function overhead.getCharHolderFromArrayINT(param1, param2) end

---@param param1 FlashObject
---@return number
function overhead.findOverlaps(param1) end

function overhead.clearAll() end

function overhead.cleanupDeleteRequests() end

function overhead.fadeOutObsoleteDialogs() end

---@param param1 FlashObject
function overhead.checkCharHolderMC(param1) end

---@param param1 FlashObject
---@return number
function overhead.getOHTPos(param1) end

---@param param1 FlashObject
---@param param2 string
---@param param3 string
---@param param4 string
function overhead.setAction(param1, param2, param3, param4) end

---@param param1 FlashObject
function overhead.checkInfoIcons(param1) end

---@param param1 FlashObject
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 boolean
---@param param6 boolean
function overhead.setHPBars(param1, param2, param3, param4, param5, param6) end

---@param param1 FlashObject
function overhead.setCharInfoPositioning(param1) end

---@param param1 FlashObject
---@param param2 number
---@return FlashObject
function overhead.changeColour(param1, param2) end

---@class UIRoot_panelSelect_c: FlashObject @panelSelect_c
---@field buttonHolder_mc FlashObject
---@field radialHolder_mc FlashObject
---@field events FlashArray
---@field openCloseTL FlashObject
---@field stickHAxis number
---@field stickVAxis number
---@field degToRad number
---@field radToDeg number
---@field layout string
---@field list FlashObject
---@field openTime number
---@field closeTime number
---@field closeScale number
---@field closeAlpha number
---@field isClosing boolean
---@field panelArray FlashArray
---@field panelStateArray FlashArray
panelSelect_c = {}

function panelSelect_c.MainTimeline() end

---@param param1 FlashObject
function panelSelect_c.onFrame(param1) end

function panelSelect_c.onEventInit() end

function panelSelect_c.onEventResize() end

---@param param1 number
function panelSelect_c.setAnchor(param1) end

---@param param1 number
function panelSelect_c.onEventDown(param1) end

---@param param1 number
function panelSelect_c.onEventUp(param1) end

---@param param1 number
function panelSelect_c.selectPanel(param1) end

---@param param1 number
---@param param2 string
function panelSelect_c.addPanel(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function panelSelect_c.removeChildrenOf(param1) end

function panelSelect_c.openMenu() end

function panelSelect_c.onOpened() end

function panelSelect_c.onClosed() end

---@param param1 boolean
function panelSelect_c.closeMenu(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function panelSelect_c.addBtnHint(param1, param2, param3) end

function panelSelect_c.clearBtnHints() end

function panelSelect_c.updatePanels() end

function panelSelect_c.updatePanelStates() end

---@param param1 number
---@param param2 boolean
function panelSelect_c.setPanelEnabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function panelSelect_c.showPanelFlash(param1, param2) end

function panelSelect_c.clearParty() end

---@class UIRoot_partyInventory: FlashObject @partyInventory
---@field inventory_mc FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isDragging boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field uiLeft number
---@field uiRight number
---@field uiTop number
---@field uiMinHeight number
---@field uiMinWidth number
---@field isSplit boolean
---@field invCellSize number
---@field invCellSpacing number
---@field invBgDiscrap number
---@field invRows number
---@field invCols number
---@field allowSound boolean
---@field inventoryUpdateList FlashArray
---@field itemsUpdateList FlashArray
---@field goldWeightList FlashArray
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field tooltipTweenTime number
---@field disableActions boolean
---@field hasTooltipEnabled boolean
---@field hasCanceled boolean
---@field tooltip_array FlashArray
---@field screenWidth number
---@field screenHeight number
---@field text_array FlashArray
---@field checkBtn_array FlashArray
---@field tooltipHandle number
---@field TTimer FlashObject
---@field equipTooltip_array FlashArray
---@field equipOffhandTooltip_array FlashArray
partyInventory = {}

function partyInventory.MainTimeline() end

---@param param1 number
function partyInventory.onEventDown(param1) end

---@param param1 number
function partyInventory.onEventUp(param1) end

---@param param1 boolean
function partyInventory.setMultiplayerMode(param1) end

function partyInventory.updateInventories() end

function partyInventory.updateItems() end

---@param param1 number
---@param param2 string
function partyInventory.setTooltipGroupLabel(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
function partyInventory.setCharacterGoldWeight(param1, param2, param3) end

function partyInventory.updateItemTooltip() end

---@param param1 number
---@param param2 number
function partyInventory.onEventResolution(param1, param2) end

function partyInventory.clearTooltip() end

function partyInventory.onEventInit() end

---@param param1 number
function partyInventory.setAnchor(param1) end

---@param param1 boolean
function partyInventory.setSplitScreen(param1) end

---@param param1 number
function partyInventory.setSelectedCharacter(param1) end

---@param param1 boolean
function partyInventory.setHLOnRT(param1) end

---@param param1 boolean
function partyInventory.setHLOnLT(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function partyInventory.addTab(param1, param2, param3) end

---@param param1 number
---@param param2 string
function partyInventory.setText(param1, param2) end

---@param param1 number
---@param param2 string
function partyInventory.setCheckBtnText(param1, param2) end

---@param param1 number
---@param param2 boolean
function partyInventory.setCheckBtnState(param1, param2) end

---@param param1 number
---@param param2 boolean
function partyInventory.setCheckBtnEnabled(param1, param2) end

---@param param1 number
function partyInventory.INV_ShowCellTooltip(param1) end

---@param param1 FlashObject
function partyInventory.INV_SendTooltipRequest(param1) end

---@param param1 string
---@param param2 string
function partyInventory.setSortBtnTexts(param1, param2) end

function partyInventory.clearSortOptions() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function partyInventory.addSortOption(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 number
function partyInventory.addBtnHint(param1, param2, param3) end

function partyInventory.clearBtnHints() end

---@param param1 FlashObject
function partyInventory.setInventorySelection(param1) end

---@param param1 number
function partyInventory.setInventorySlotSelection(param1) end

function partyInventory.clearSlots() end

---@param param1 number
---@param param2 number
---@param param3 string
function partyInventory.addInventoryFilter(param1, param2, param3) end

function partyInventory.removeInventoryFilters() end

---@param param1 number
function partyInventory.selectInventoryFilter(param1) end

---@param param1 number
function partyInventory.selectTab(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function partyInventory.startsWith(param1, param2) end

---@param param1 number
---@param param2 boolean
function partyInventory.setActionsDisabled(param1, param2) end

---@param param1 boolean
---@param param2 boolean
function partyInventory.hideTooltip(param1, param2) end

---@param param1 boolean
function partyInventory.showTooltip(param1) end

---@param param1 boolean
function partyInventory.tooltipTweenDone(param1) end

---@return boolean
function partyInventory.canShowTooltip() end

function partyInventory.updateEquipTooltip() end

function partyInventory.updateEquipOffhandTooltip() end

function partyInventory.clearEquipTooltip() end

function partyInventory.clearEquipOffhandTooltip() end

---@param param1 string
function partyInventory.tooltipEquippedString(param1) end

---@param param1 string
function partyInventory.setOffhandString(param1) end

---@param param1 boolean
function partyInventory.enableCompare(param1) end

---@param param1 number
---@param param2 string
function partyInventory.setTooltipCompareHint(param1, param2) end

function partyInventory.clearTooltipCompareHints() end

---@param param1 string
---@param param2 string
function partyInventory.addKeyHint(param1, param2) end

function partyInventory.clearKeyHints() end

---@class UIRoot_partyInventory_c: FlashObject @partyInventory_c
---@field inventoryPanel_mc FlashObject
---@field events FlashArray
---@field layout string
---@field charIconW number
---@field charIconH number
---@field cols number
---@field rows number
---@field cellSize number
---@field cellSpacing number
---@field bgDisp number
---@field itemSizeDiff number
---@field itemDisp number
---@field partyUpdateList FlashArray
---@field inventoryUpdateList FlashArray
---@field btnHintUpdateList FlashArray
---@field tabs_Array FlashArray
---@field tooltip_array FlashArray
---@field compareTooltip_array FlashArray
---@field offhandTooltip_array FlashArray
---@field ownerHandle number
---@field canCompare boolean
---@field inMultiSelect boolean
---@field skillBarSlot number
---@field _canMultiSelect boolean
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field canSwitchInv boolean
partyInventory_c = {}

function partyInventory_c.MainTimeline() end

function partyInventory_c.onEventInit() end

---@param param1 number
---@return boolean
function partyInventory_c.onEventDown(param1) end

---@param param1 boolean
function partyInventory_c.clearMultiSelect(param1) end

---@param param1 number
---@return boolean
function partyInventory_c.onEventUp(param1) end

function partyInventory_c.getCurrentInventoryState() end

---@param param1 number
function partyInventory_c.addInventoryFilters(param1) end

function partyInventory_c.removeInventoryFilters() end

---@param param1 number
---@param param2 boolean
function partyInventory_c.setPlayer(param1, param2) end

---@param param1 number
function partyInventory_c.updateParty(param1) end

---@param param1 boolean
function partyInventory_c.updateInventory(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function partyInventory_c.addBtnHint(param1, param2, param3) end

function partyInventory_c.updateButtonHints() end

function partyInventory_c.showPanel() end

---@param param1 string
function partyInventory_c.setPanelTitle(param1) end

function partyInventory_c.setActionsDisabled() end

function partyInventory_c.updateArraySystem() end

function partyInventory_c.setAmountOfPlayers() end

---@param param1 number
---@param param2 string
function partyInventory_c.setCompareTooltipButtonPrompt(param1, param2) end

function partyInventory_c.updateTooltip() end

function partyInventory_c.resetTooltip() end

---@param param1 number
---@param param2 boolean
function partyInventory_c.setInventoryDisabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function partyInventory_c.setCharacterState(param1, param2) end

---@param param1 boolean
function partyInventory_c.setMultiplayerMode(param1) end

---@param param1 boolean
function partyInventory_c.setPartyHandleChanged(param1) end

---@class UIRoot_playerInfo: FlashObject @playerInfo
---@field container_mc FlashObject
---@field deselectedAlpha number
---@field statusSize number
---@field statusSpacing number
---@field selectedCharacterHandle number
---@field events FlashArray
---@field animationArray FlashArray
---@field layout string
---@field curTooltip number
---@field hasTooltip boolean
---@field isDragging boolean
---@field allowDragging boolean
---@field toggleButtonTooltips FlashArray
---@field listNeedsReordering boolean
---@field uiScaling number
---@field defaultHPColour number
---@field releaseDistY number
---@field curTooltipOwner number
---@field playerXpos number
---@field inventorySkillButtonX number
---@field inventorySkillButtonY number
---@field infoUpdate FlashArray
---@field linkPieces FlashArray
---@field statusIconSize number
---@field statusIconOffsetX number
---@field statusIconOffsetY number
---@field iconHeight number
---@field iconWidth number
---@field isLeft boolean
---@field wideSpacingMultiplier number
---@field guiStatusValues FlashArray
---@field successString string
---@field failureString string
---@field _isGMState boolean
---@field doubleClickTimer FlashObject
---@field dcTStr string
---@field piSpacing number
---@field piMode number
---@field selectedPlayer FlashObject
---@field player_array FlashArray
---@field disabledBtnAlpha number
---@field status_array FlashArray
---@field allowDragUpdate boolean
---@field boundaryRect FlashObject
---@field currentDraggedPI FlashObject
---@field maxGroupId number
---@field pullLooseX number
---@field oldClosestMC FlashObject
---@field playerIsBeingDragged boolean
---@field oldAbovePlayer number
---@field playerDragPosX number
---@field playerDragPosY number
---@field startDragDist number
---@field isController boolean
playerInfo = {}

function playerInfo.MainTimeline() end

function playerInfo.onEventResize() end

function playerInfo.updateInfos() end

---@param param1 number
function playerInfo.onEventUp(param1) end

---@param param1 number
---@param param2 string
function playerInfo.setGUIStatusLabel(param1, param2) end

---@param param1 number
---@param param2 string
function playerInfo.setTooltips(param1, param2) end

---@param param1 number
function playerInfo.setDefaultHPColour(param1) end

function playerInfo.onEventInit() end

---@param param1 number
function playerInfo.setAnchor(param1) end

---@param param1 boolean
function playerInfo.setLeft(param1) end

---@param param1 FlashObject
function playerInfo.dcTEnded(param1) end

---@param param1 number
function playerInfo.onEventDown(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function playerInfo.startsWith(param1, param2) end

function playerInfo.removeAllInfos() end

---@param param1 number
function playerInfo.removeInfo(param1) end

---@param param1 FlashObject
---@return FlashObject
function playerInfo.removeChildrenOf(param1) end

---@param param1 number
---@param param2 number
function playerInfo.setArmourBar(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.setArmourBarColour(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.setMagicArmourBarColour(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.setMagicArmourBar(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.setGUIStatus(param1, param2) end

---@param param1 FlashObject
---@param param2 number
function playerInfo.setMCGUIStatus(param1, param2) end

---@param param1 FlashObject
---@param param2 number
function playerInfo.setMCEquipState(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.setEquipState(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.fadeOutStatusComplete(param1, param2) end

---@param param1 boolean
---@param param2 boolean
function playerInfo.updateStatuses(param1, param2) end

---@param param1 boolean
function playerInfo.cleanupAllStatuses(param1) end

---@param param1 FlashObject
---@param param2 boolean
function playerInfo.cleanupStatusesMC(param1, param2) end

---@param param1 number
function playerInfo.cleanupStatuses(param1) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@param param7 string
function playerInfo.setStatus(param1, param2, param3, param4, param5, param6, param7) end

---@param param1 FlashObject
function playerInfo.showStatusTooltipForMC(param1) end

---@param param1 FlashObject
function playerInfo.showTooltipForMC(param1) end

---@param param1 FlashObject
---@return FlashObject
function playerInfo.getGlobalPositionOfMC(param1) end

---@param param1 number
function playerInfo.startDragging(param1) end

---@param param1 FlashObject
function playerInfo.stopDragging(param1) end

---@param param1 FlashObject
function playerInfo.onPIDragging(param1) end

function playerInfo.alphaResetPIs() end

---@return FlashObject
function playerInfo.getClosestPlayer() end

---@return number
function playerInfo.getPlayerAbove() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 number
---@param param5 boolean
---@param param6 number
---@param param7 number
---@param param8 number
---@param param10 number
---@param param11 number
---@param param12 number
---@param param13 boolean
---@param param14 number
function playerInfo.addInfo(param1, param2, param3, param4, param5, param6, param7, param8, param10, param11, param12, param13, param14) end

---@param param1 FlashObject
---@param param2 string
function playerInfo.setIggyImage(param1, param2) end

---@param param1 number
---@param param2 string
function playerInfo.setSummonTurnText(param1, param2) end

---@param param1 FlashObject
---@param param2 string
---@return boolean
function playerInfo.setSummonTurnTextMC(param1, param2) end

---@param param1 boolean
function playerInfo.setControllerMode(param1) end

---@param param1 number
function playerInfo.setAmountOfPlayers(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 string
---@param param6 number
---@param param7 number
---@param param8 number
function playerInfo.addSummonInfo(param1, param2, param3, param4, param5, param6, param7, param8) end

function playerInfo.reorderlist() end

function playerInfo.updateDone() end

---@param param1 number
---@param param2 number
function playerInfo.removeSummonInfo(param1, param2) end

---@param param1 number
---@param param2 boolean
function playerInfo.setControlledCharacter(param1, param2) end

---@param param1 boolean
function playerInfo.setAllowMouseClicking(param1) end

---@param param1 number
---@param param2 boolean
function playerInfo.setDisabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function playerInfo.setIsDead(param1, param2) end

---@param param1 number
---@param param2 boolean
---@param param3 number
---@param param4 number
---@param param5 number
function playerInfo.setLevelUp(param1, param2, param3, param4, param5) end

---@param param1 FlashObject
---@param param2 boolean
---@param param3 number
---@param param4 number
---@param param5 number
function playerInfo.setMCLevelUp(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 number
function playerInfo.setCurrentActionState(param1, param2) end

---@param param1 FlashObject
---@param param2 number
function playerInfo.setMCCurrentActionState(param1, param2) end

---@param param1 number
function playerInfo.selectPlayer(param1) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function playerInfo.setHPBar(param1, param2, param3) end

---@param param1 number
---@param param2 number
---@param param3 number
function playerInfo.setSourcePoints(param1, param2, param3) end

---@param param1 number
function playerInfo.resetHPColour(param1) end

---@param param1 number
---@param param2 number
function playerInfo.setHPColour(param1, param2) end

---@param param1 number
---@param param2 boolean
function playerInfo.setVisible(param1, param2) end

function playerInfo.clearAllLinkers() end

function playerInfo.clearAllLinkPieces() end

---@param param1 boolean
function playerInfo.addLinkers(param1) end

---@param param1 number
---@param param2 boolean
function playerInfo.setHighlight(param1, param2) end

---@param param1 number
---@return FlashObject
function playerInfo.getPlayerInfo(param1) end

---@param param1 number
---@return FlashObject
function playerInfo.getPlayerOrSummonByHandle(param1) end

---@param param1 number
---@return FlashObject
function playerInfo.getPlayerInfoByHandle(param1) end

---@param param1 boolean
function playerInfo.repositionPIWider(param1) end

function playerInfo.repositionPI() end

function playerInfo.handleItemTransferAnims() end

---@param param1 FlashArray
---@param param2 number
---@return FlashObject
function playerInfo.getObjectbyPlayerId(param1, param2) end

---@param param1 number
---@param param2 number
function playerInfo.playerInfoJumpBack(param1, param2) end

---@param param1 FlashObject
function playerInfo.playerInfoJumpBack2(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 boolean
function playerInfo.showItemTransferAnim(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
---@param param3 number
function playerInfo.addRoll(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
function playerInfo.addRollResult(param1, param2) end

function playerInfo.clearRolls() end

---@class UIRoot_pyramid: FlashObject @pyramid
---@field popup_mc FlashObject
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field text_array FlashArray
---@field pyramid_array FlashArray
pyramid = {}

function pyramid.MainTimeline() end

function pyramid.onEventInit() end

function pyramid.onEventResize() end

---@param param1 number
function pyramid.onEventUp(param1) end

---@param param1 number
function pyramid.onEventDown(param1) end

function pyramid.open() end

function pyramid.close() end

function pyramid.closeAnimDone() end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 boolean
function pyramid.setPyramid(param1, param2, param3, param4) end

---@param param1 string
function pyramid.setTitle(param1) end

function pyramid.updatePyramids() end

function pyramid.clearPyramids() end

---@param param1 FlashObject
function pyramid.selectClickedTab(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function pyramid.addBtnHint(param1, param2, param3) end

---@return FlashObject
function pyramid.hideWin() end

---@return FlashObject
function pyramid.showWin() end

---@return number
function pyramid.getHeight() end

---@return number
function pyramid.getWidth() end

---@param param1 number
---@return FlashObject
function pyramid.setX(param1) end

---@param param1 number
---@return FlashObject
function pyramid.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function pyramid.setPos(param1, param2) end

---@return number
function pyramid.getX() end

---@return number
function pyramid.getY() end

---@param param1 number
---@param param2 string
function pyramid.setText(param1, param2) end

---@class UIRoot_pyramid_c: FlashObject @pyramid_c
---@field btnHintHolder_mc FlashObject
---@field popup_mc FlashObject
---@field events FlashArray
---@field layout string
---@field text_array FlashArray
---@field pyramid_array FlashArray
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field buttonHint_mc FlashObject
pyramid_c = {}

function pyramid_c.MainTimeline() end

---@param param1 number
function pyramid_c.setAnchor(param1) end

function pyramid_c.onEventInit() end

function pyramid_c.onEventResize() end

---@param param1 number
function pyramid_c.onEventUp(param1) end

---@param param1 number
function pyramid_c.onEventDown(param1) end

function pyramid_c.open() end

function pyramid_c.close() end

function pyramid_c.closeAnimDone() end

---@param param1 number
---@param param2 string
---@param param3 string
---@param param4 boolean
function pyramid_c.setPyramid(param1, param2, param3, param4) end

---@param param1 string
function pyramid_c.setTitle(param1) end

function pyramid_c.updatePyramids() end

function pyramid_c.clearPyramids() end

---@param param1 FlashObject
function pyramid_c.selectClickedTab(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function pyramid_c.addBtnHint(param1, param2, param3) end

function pyramid_c.clearBtnHints() end

---@return FlashObject
function pyramid_c.hideWin() end

---@return FlashObject
function pyramid_c.showWin() end

---@return number
function pyramid_c.getHeight() end

---@return number
function pyramid_c.getWidth() end

---@param param1 number
---@return FlashObject
function pyramid_c.setX(param1) end

---@param param1 number
---@return FlashObject
function pyramid_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function pyramid_c.setPos(param1, param2) end

---@return number
function pyramid_c.getX() end

---@return number
function pyramid_c.getY() end

---@param param1 number
---@param param2 string
function pyramid_c.setText(param1, param2) end

---@class UIRoot_reward: FlashObject @reward
---@field reward_mc FlashObject
---@field layout string
---@field alignment string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field icon_size number
---@field events FlashArray
---@field items_array FlashArray
reward = {}

function reward.MainTimeline() end

function reward.onEventResize() end

function reward.updateItems() end

function reward.clearSlots() end

---@param param1 number
function reward.onEventUp(param1) end

---@param param1 number
function reward.onEventDown(param1) end

function reward.onEventInit() end

---@param param1 string
function reward.setTitle(param1) end

---@param param1 string
function reward.setOptionalRewardText(param1) end

---@param param1 string
function reward.setMandatoryRewardText(param1) end

---@param param1 string
function reward.setButtonText(param1) end

---@param param1 boolean
function reward.setButtonDisabled(param1) end

---@param param1 number
---@param param2 boolean
function reward.setSelectedItem(param1, param2) end

---@param param1 string
function reward.setSelectButtonHintText(param1) end

---@param param1 string
function reward.setHoldForAcceptButtonHintText(param1) end

---@param param1 string
function reward.setAcceptButtonHintText(param1) end

---@param param1 string
function reward.setDetailsButtonHintText(param1) end

---@class UIRoot_saveLoad: FlashObject @saveLoad
---@field loadSave_mc FlashObject
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field events FlashArray
---@field layout string
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field cloudIcon_array FlashArray
---@field entry_array FlashArray
---@field cloudTooltips FlashArray
---@field gameModeTooltipArray FlashArray
---@field deleteCrossTooltip string
---@field editAddonsTooltip string
saveLoad = {}

function saveLoad.MainTimeline() end

function saveLoad.onEventInit() end

---@param param1 number
---@return boolean
function saveLoad.onEventUp(param1) end

---@param param1 number
---@return boolean
function saveLoad.onEventDown(param1) end

---@param param1 number
---@param param2 string
function saveLoad.setTooltip(param1, param2) end

---@param param1 boolean
function saveLoad.showNewSave(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 string
---@param param5 string
---@param param6 string
---@param param7 string
---@param param8 string
---@param param9 number
---@param param10 number
function saveLoad.addSave(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 string
---@param param5 string
---@param param6 string
---@param param7 string
---@param param8 string
---@param param9 number
---@param param10 number
function saveLoad.addLoad(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) end

---@param param1 number
---@param param2 boolean
function saveLoad.setSaveEditable(param1, param2) end

---@param param1 number
---@param param2 string
function saveLoad.setText(param1, param2) end

---@param param1 boolean
function saveLoad.setCloudSyncAnimVisible(param1) end

---@param param1 boolean
function saveLoad.setNewButtonVisible(param1) end

---@param param1 boolean
function saveLoad.setSaveButtonEnabled(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function saveLoad.addPlayerTab(param1, param2, param3) end

function saveLoad.clearPlayerTabs() end

function saveLoad.updateArraySystem() end

---@param param1 number
---@param param2 number
function saveLoad.setEntryCloudIcon(param1, param2) end

function saveLoad.executeSelected() end

---@param param1 boolean
function saveLoad.moveCursor(param1) end

function saveLoad.removeItems() end

function saveLoad.updateButtonAndInfo() end

---@param param1 number
function saveLoad.setCursorPosition(param1) end

---@param param1 boolean
function saveLoad.showEditAddons(param1) end

---@return FlashObject
function saveLoad.hideWin() end

---@return FlashObject
function saveLoad.showWin() end

---@return number
function saveLoad.getHeight() end

---@return number
function saveLoad.getWidth() end

---@param param1 number
---@return FlashObject
function saveLoad.setX(param1) end

---@param param1 number
---@return FlashObject
function saveLoad.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function saveLoad.setPos(param1, param2) end

---@return number
function saveLoad.getX() end

---@return number
function saveLoad.getY() end

---@class UIRoot_saveLoad_c: FlashObject @saveLoad_c
---@field btnContainer_mc FlashObject
---@field loadSave_mc FlashObject
---@field events FlashArray
---@field layout string
---@field hasTooltip boolean
---@field cloudIcon_array FlashArray
---@field entry_array FlashArray
---@field cloudTooltips FlashArray
---@field gameModeTooltipArray FlashArray
---@field deleteCrossTooltip string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field text_array FlashArray
saveLoad_c = {}

function saveLoad_c.MainTimeline() end

function saveLoad_c.onEventInit() end

function saveLoad_c.onEventResize() end

function saveLoad_c.showNewSave() end

---@param param1 number
---@return boolean
function saveLoad_c.onEventUp(param1) end

---@param param1 number
---@return boolean
function saveLoad_c.onEventDown(param1) end

---@param param1 boolean
function saveLoad_c.setNewButtonVisible(param1) end

---@param param1 boolean
function saveLoad_c.setSaveButtonEnabled(param1) end

---@param param1 number
---@param param2 string
function saveLoad_c.setTooltip(param1, param2) end

---@param param1 string
function saveLoad_c.addNewSave(param1) end

---@param param1 number
---@param param2 boolean
function saveLoad_c.setSaveEditable(param1, param2) end

---@param param1 number
---@param param2 string
function saveLoad_c.setText(param1, param2) end

---@param param1 boolean
function saveLoad_c.setCloudSyncAnimVisible(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function saveLoad_c.addPlayerTab(param1, param2, param3) end

function saveLoad_c.clearPlayerTabs() end

function saveLoad_c.updateArraySystem() end

---@param param1 number
---@param param2 number
function saveLoad_c.setEntryCloudIcon(param1, param2) end

function saveLoad_c.executeSelected() end

---@param param1 boolean
function saveLoad_c.moveCursor(param1) end

function saveLoad_c.removeItems() end

---@param param1 number
function saveLoad_c.setCursorPosition(param1) end

---@param param1 boolean
function saveLoad_c.showEditAddons(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function saveLoad_c.addBtnHint(param1, param2, param3) end

function saveLoad_c.clearBtnHints() end

---@return FlashObject
function saveLoad_c.hideWin() end

---@return FlashObject
function saveLoad_c.showWin() end

---@return number
function saveLoad_c.getHeight() end

---@return number
function saveLoad_c.getWidth() end

---@param param1 number
---@return FlashObject
function saveLoad_c.setX(param1) end

---@param param1 number
---@return FlashObject
function saveLoad_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function saveLoad_c.setPos(param1, param2) end

---@return number
function saveLoad_c.getX() end

---@return number
function saveLoad_c.getY() end

---@class UIRoot_saving: FlashObject @saving
---@field mcInfoMsg FlashObject
---@field saving_mc FlashObject
---@field events FlashArray
---@field layout string
saving = {}

function saving.MainTimeline() end

function saving.onEventResize() end

function saving.onEventInit() end

---@param param1 string
function saving.setText(param1) end

---@param param1 string
function saving.setInfoText(param1) end

---@param param1 boolean
function saving.showSavingAnim(param1) end

---@param param1 boolean
function saving.showInfoText(param1) end

---@class UIRoot_serverlist: FlashObject @serverlist
---@field backButton_mc FlashObject
---@field chat_mc FlashObject
---@field close_mc FlashObject
---@field createServer_mc FlashObject
---@field gmCampaignPreview_mc FlashObject
---@field heroSelect_mc FlashObject
---@field lefPanelBg_mc FlashObject
---@field lobby_mc FlashObject
---@field quit_mc FlashObject
---@field serverInfo_mc FlashObject
---@field serverName_mc FlashObject
---@field MiniMapSize number
---@field iconHeight number
---@field iconWidth number
---@field skillIconSize number
---@field skillIconSpacing number
---@field events FlashArray
---@field layout string
---@field curTooltip string
---@field hasTooltip boolean
---@field currentTab number
---@field btn_array FlashArray
---@field btnCmds_array FlashArray
---@field isMaster boolean
---@field tooltipPos FlashObject
---@field tooltipHeight number
---@field tooltipWidth number
---@field skillsUpdateList FlashArray
---@field campaignUpdateArray FlashArray
---@field slot_types FlashArray
---@field common_available_types FlashArray
---@field arena_available_types FlashArray
---@field hotseat_available_types FlashArray
---@field strings FlashObject
---@field currentTeamId number
---@field gameMode number
---@field selectedCampaign string
---@field filterUpdateArray FlashArray
---@field listGroups FlashArray
---@field listUpdateArray FlashArray
---@field campaign FlashArray
---@field previewBtnTxt FlashArray
---@field characterHandle number
---@field isTyping boolean
---@field _isHotSeat boolean
---@field _uiMode number
---@field editing boolean
---@field text_array FlashArray
---@field serverlistEnabled boolean
serverlist = {}

function serverlist.MainTimeline() end

function serverlist.onEventInit() end

function serverlist.previewCampaignMode() end

---@param param1 string
---@param param2 string
function serverlist.setCampaignDesc(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.setButtonText(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist.setButtonDisabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist.setButtonVisible(param1, param2) end

---@param param1 string
function serverlist.setMainButtonTooltip(param1) end

---@param param1 FlashObject
---@param param2 boolean
---@param param3 string
function serverlist.showBtnTooltip(param1, param2, param3) end

function serverlist.onEventResize() end

---@param param1 number
function serverlist.onEventUp(param1) end

---@param param1 number
function serverlist.onEventDown(param1) end

---@param param1 FlashObject
function serverlist.onButtonPressed(param1) end

---@return FlashObject
function serverlist.hideWin() end

---@return FlashObject
function serverlist.showWin() end

---@return number
function serverlist.getHeight() end

---@return number
function serverlist.getWidth() end

---@param param1 number
---@return FlashObject
function serverlist.setX(param1) end

---@param param1 number
---@return FlashObject
function serverlist.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function serverlist.setPos(param1, param2) end

---@return number
function serverlist.getX() end

---@return number
function serverlist.getY() end

function serverlist.openMenu() end

function serverlist.closeMenu() end

---@param param1 boolean
function serverlist.setListDisabled(param1) end

---@param param1 number
---@param param2 string
function serverlist.setText(param1, param2) end

---@param param1 string
function serverlist.setOptionsTitle(param1) end

---@param param1 number
function serverlist.removeServer(param1) end

---@param param1 boolean
function serverlist.setCloseBtnDisable(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 number
---@param param5 number
---@param param6 string
---@param param7 string
---@param param8 number
---@param param9 boolean
---@param param10 boolean
---@param param11 string
function serverlist.setServer(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) end

---@param param1 number
---@param param2 string
function serverlist.addTab(param1, param2) end

---@param param1 number
function serverlist.selectTab(param1) end

---@param param1 number
---@param param2 string
function serverlist.setTabText(param1, param2) end

---@param param1 boolean
function serverlist.useServerPasswords(param1) end

---@param param1 boolean
function serverlist.setServerListInputEnabled(param1) end

---@param param1 boolean
function serverlist.setSearchingVisible(param1) end

---@param param1 number
---@param param2 boolean
function serverlist.setTabEnabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist.setTabInputEnabled(param1, param2) end

function serverlist.clearSorts() end

---@param param1 number
---@param param2 string
function serverlist.setSortTitles(param1, param2) end

function serverlist.clearServerList() end

function serverlist.executeSelected() end

---@param param1 string
function serverlist.moveCursor(param1) end

---@param param1 number
function serverlist.setCursorPosition(param1) end

---@param param1 string
function serverlist.addLog(param1) end

function serverlist.clearLog() end

---@param param1 number
---@param param2 string
function serverlist.addUser(param1, param2) end

function serverlist.clearUsers() end

---@param param1 number
function serverlist.removeUser(param1) end

---@param param1 number
---@param param2 string
---@param param3 string
function serverlist.addFilterInput(param1, param2, param3) end

---@param param1 number
---@param param2 string
function serverlist.setFilterInputText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 boolean
function serverlist.setFilterCheckbox(param1, param2, param3, param4) end

---@param param1 number
---@param param2 boolean
function serverlist.setFilterEnabled(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function serverlist.addFilterNumberbox(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function serverlist.setFilterNumberbox(param1, param2, param3) end

---@param param1 number
---@param param2 string
function serverlist.addMapOption(param1, param2) end

---@param param1 number
function serverlist.selectMapOption(param1) end

function serverlist.clearMapOptions() end

function serverlist.addFilters() end

---@param param1 number
---@param param2 string
function serverlist.addFilterDropDown(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist.addFilterDropDownOption(param1, param2, param3) end

---@param param1 number
function serverlist.clearFilterDropDownOptions(param1) end

---@param param1 number
---@param param2 number
function serverlist.selectFilterDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.selectFilterDropDownEntryString(param1, param2) end

---@param param1 number
function serverlist.clearFilterDD(param1) end

function serverlist.updateFilterList() end

function serverlist.clearFilters() end

---@param param1 boolean
function serverlist.setConnectIpButtonVisible(param1) end

---@param param1 boolean
function serverlist.setConnectIpButtonEnabled(param1) end

---@param param1 string
function serverlist.addTextToChat(param1) end

function serverlist.clearTextFromChat() end

---@param param1 number
function serverlist.setMaxInputlength(param1) end

---@param param1 string
function serverlist.disableChatInput(param1) end

---@param param1 number
function serverlist.setUIMode(param1) end

---@param param1 FlashObject
---@return FlashObject
function serverlist.getGlobalPositionOfMC(param1) end

---@param param1 boolean
function serverlist.setHotSeat(param1) end

function serverlist.updatePlayerComboBoxes() end

---@param param1 number
---@param param2 string
function serverlist.setSlotName(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist.heroPick_setLocalPlayer(param1, param2) end

---@param param1 number
---@param param2 number
function serverlist.setHeroSelectionPartyTeam(param1, param2) end

function serverlist.showReadyFade() end

function serverlist.hideReadyFade() end

---@param param1 string
---@param param2 string
function serverlist.setHeroInfo(param1, param2) end

function serverlist.clearHeroTraits() end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist.addHeroAbility(param1, param2, param3) end

---@param param1 number
---@param param2 string
function serverlist.addHeroTalent(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.addMutatorCheckBox(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist.setMutatorCheckBoxChecked(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.addMutatorDropDown(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist.addMutatorDropDownOption(param1, param2, param3) end

---@param param1 number
---@param param2 number
function serverlist.selectMutatorDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 string
---@param param6 string
function serverlist.addMutatorSlider(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 number
function serverlist.setMutatorSliderValue(param1, param2) end

function serverlist.updateSkills() end

---@param param1 number
---@param param2 boolean
function serverlist.setHeroSelectionPartyReady(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.setHeroSelectionPartyName(param1, param2) end

---@param param1 number
---@param param2 number
function serverlist.setPlayerAmount(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
function serverlist.setHeroSlot(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist.addHeroToSelectionList(param1, param2, param3) end

---@param param1 number
---@param param2 number
function serverlist.setupHeroSelectionList(param1, param2) end

function serverlist.showHeroSelectionList() end

function serverlist.hideHeroSelectionList() end

---@param param1 number
function serverlist.selectHeroSelection(param1) end

---@param param1 string
---@param param2 string
function serverlist.setServerName(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.addTeam(param1, param2) end

---@param param1 number
---@return number
function serverlist.getTeamColour(param1) end

function serverlist.clearTeams() end

---@param param1 boolean
function serverlist.setMasterPlayer(param1) end

---@param param1 number
---@param param2 number
---@param param3 boolean
---@param param4 string
function serverlist.addPeer(param1, param2, param3, param4) end

---@param param1 number
---@param param2 boolean
function serverlist.setPeerAssigned(param1, param2) end

---@param param1 number
function serverlist.removePeer(param1) end

function serverlist.clearPeers() end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 boolean
---@param param6 boolean
function serverlist.setSlotClient(param1, param2, param3, param4, param5, param6) end

---@param param1 number
function serverlist.setSlotDisabled(param1) end

---@param param1 string
function serverlist.addSlotDropDownOptions(param1) end

---@param param1 number
function serverlist.setSlotEmpty(param1) end

---@param param1 number
---@param param2 string
function serverlist.addCSTab(param1, param2) end

---@param param1 number
function serverlist.selectCSTab(param1) end

function serverlist.clearCSTabs() end

---@param param1 number
function serverlist.removeCSTab(param1) end

---@param param1 number
function serverlist.addGroups(param1) end

---@param param1 number
function serverlist.updateGroupedList(param1) end

---@param param1 number
---@param param2 string
function serverlist.selectGroupedElement(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist.setLabelContent(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist.setSlotReady(param1, param2) end

---@class UIRoot_serverlist_c: FlashObject @serverlist_c
---@field heroSelect_mc FlashObject
---@field lobbyRoom_mc FlashObject
---@field lobby_mc FlashObject
---@field events FlashArray
---@field layout string
---@field designResolution FlashObject
---@field totalDrawWidth number
---@field uiScaling number
---@field curTooltip string
---@field hasTooltip boolean
---@field MiniMapSize number
---@field iconWidth number
---@field iconHeight number
---@field skillIconSize number
---@field skillIconSpacing number
---@field campaign FlashArray
---@field skillsUpdateList FlashArray
---@field abilitiesUpdateList FlashArray
---@field talentsUpdateList FlashArray
---@field currentTeamId number
---@field tooltip_array FlashArray
---@field btnHintArray FlashArray
---@field slotActions FlashArray
---@field slot_types FlashArray
---@field strings FlashObject
---@field uiMode number
---@field gameMode number
---@field maxOpenSlots number
---@field tabButtonNone number
---@field tabButtonNext number
---@field tabButtonPrev number
---@field tabButtonDown number
---@field downStr string
---@field serverUpdateList FlashArray
---@field serverlistEnabled boolean
serverlist_c = {}

function serverlist_c.MainTimeline() end

---@param param1 boolean
function serverlist_c.setMasterPlayer(param1) end

---@param param1 boolean
function serverlist_c.setHotSeat(param1) end

---@param param1 number
---@param param2 number
function serverlist_c.onEventResolution(param1, param2) end

---@param param1 string
---@param param2 string
function serverlist_c.setServerName(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist_c.addFilterDropDown(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist_c.addFilterDropDownOption(param1, param2, param3) end

---@param param1 number
---@param param2 number
function serverlist_c.selectFilterDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
function serverlist_c.addFilterInput(param1, param2, param3) end

---@param param1 number
---@param param2 string
function serverlist_c.setFilterInputText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 boolean
function serverlist_c.setFilterCheckbox(param1, param2, param3, param4) end

---@param param1 number
---@param param2 boolean
function serverlist_c.setFilterEnabled(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function serverlist_c.addFilterNumberbox(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function serverlist_c.setFilterNumberbox(param1, param2, param3) end

---@param param1 number
---@param param2 string
function serverlist_c.addMutatorDropDown(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist_c.addMutatorDropDownOption(param1, param2, param3) end

---@param param1 number
---@param param2 number
function serverlist_c.selectMutatorDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 string
---@param param6 string
function serverlist_c.addMutatorSlider(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 number
function serverlist_c.setMutatorSliderValue(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 boolean
---@param param6 boolean
function serverlist_c.setSlotClient(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 string
function serverlist_c.setSlotName(param1, param2) end

---@param param1 number
---@param param2 boolean
---@param param3 boolean
function serverlist_c.setSlotDisabled(param1, param2, param3) end

---@param param1 number
---@param param2 boolean
function serverlist_c.setSlotReady(param1, param2) end

---@param param1 string
function serverlist_c.addSlotDropDownOptions(param1) end

---@param param1 number
---@param param2 string
function serverlist_c.setLabelContent(param1, param2) end

---@param param1 string
---@param param2 string
function serverlist_c.setCampaignDesc(param1, param2) end

---@param param1 number
function serverlist_c.setSlotEmpty(param1) end

---@param param1 number
---@param param2 string
function serverlist_c.addTeam(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 boolean
---@param param4 string
function serverlist_c.addPeer(param1, param2, param3, param4) end

---@param param1 number
function serverlist_c.setUIMode(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist_c.addHeroToSelectionList(param1, param2, param3) end

function serverlist_c.updateSkills() end

---@param param1 number
---@param param2 boolean
function serverlist_c.setHeroSelectionPartyReady(param1, param2) end

---@param param1 number
---@param param2 number
function serverlist_c.setPlayerAmount(param1, param2) end

---@param param1 number
function serverlist_c.selectHeroSelection(param1) end

---@param param1 number
---@param param2 number
function serverlist_c.setupHeroSelectionList(param1, param2) end

---@param param1 number
---@param param2 boolean
function serverlist_c.heroPick_setLocalPlayer(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist_c.setHeroSelectionPartyName(param1, param2) end

---@param param1 number
---@param param2 number
function serverlist_c.setHeroSelectionPartyTeam(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
function serverlist_c.setHeroSlot(param1, param2, param3, param4) end

function serverlist_c.showReadyFade() end

function serverlist_c.hideReadyFade() end

function serverlist_c.onEventInit() end

---@param param1 number
function serverlist_c.onEventUp(param1) end

---@param param1 number
function serverlist_c.onEventDown(param1) end

function serverlist_c.updateSkillTooltip() end

---@param param1 string
---@param param2 string
function serverlist_c.setHeroInfo(param1, param2) end

function serverlist_c.clearHeroTraits() end

---@param param1 number
---@param param2 number
---@param param3 string
function serverlist_c.addHeroAbility(param1, param2, param3) end

---@param param1 number
---@param param2 string
function serverlist_c.addHeroTalent(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function serverlist_c.removeChildrenOf(param1) end

---@param param1 FlashObject
---@param param2 string
function serverlist_c.setIggyImage(param1, param2) end

---@param param1 number
function serverlist_c.serverListOnEventUp(param1) end

---@param param1 number
function serverlist_c.serverListOnEventDown(param1) end

---@return FlashObject
function serverlist_c.hideWin() end

---@return FlashObject
function serverlist_c.showWin() end

---@return number
function serverlist_c.getHeight() end

---@return number
function serverlist_c.getWidth() end

---@param param1 number
---@return FlashObject
function serverlist_c.setX(param1) end

---@param param1 number
---@return FlashObject
function serverlist_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function serverlist_c.setPos(param1, param2) end

---@return number
function serverlist_c.getX() end

---@return number
function serverlist_c.getY() end

---@param param1 number
---@param param2 string
function serverlist_c.setText(param1, param2) end

---@param param1 number
function serverlist_c.removeServer(param1) end

---@param param1 boolean
function serverlist_c.setCloseBtnDisable(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 number
---@param param5 number
---@param param6 string
---@param param7 string
---@param param8 number
---@param param9 number
---@param param10 boolean
---@param param11 string
function serverlist_c.setServer(param1, param2, param3, param4, param5, param6, param7, param8, param9, param10, param11) end

function serverlist_c.updateServers() end

---@param param1 number
---@param param2 string
function serverlist_c.addTab(param1, param2) end

---@param param1 number
function serverlist_c.selectTab(param1) end

---@param param1 number
---@param param2 string
function serverlist_c.setTabText(param1, param2) end

---@param param1 boolean
function serverlist_c.useServerPasswords(param1) end

---@param param1 boolean
function serverlist_c.setListDisabled(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function serverlist_c.addBtnHint(param1, param2, param3) end

function serverlist_c.updateBtnHints() end

function serverlist_c.clearBtnHints() end

---@param param1 number
---@param param2 string
---@param param3 number
function serverlist_c.addBtnHintFilterPanel(param1, param2, param3) end

function serverlist_c.clearBtnHintsFilterPanel() end

---@param param1 number
function serverlist_c.setConnectionState(param1) end

---@param param1 boolean
function serverlist_c.setSearchingVisible(param1) end

---@param param1 number
---@param param2 boolean
function serverlist_c.setTabEnabled(param1, param2) end

function serverlist_c.clearSorts() end

---@param param1 number
---@param param2 string
function serverlist_c.setSortTitles(param1, param2) end

function serverlist_c.clearServerList() end

function serverlist_c.executeSelected() end

---@param param1 string
function serverlist_c.moveCursor(param1) end

---@param param1 number
function serverlist_c.setCursorPosition(param1) end

---@param param1 string
function serverlist_c.addLog(param1) end

function serverlist_c.clearLog() end

---@param param1 number
---@param param2 string
function serverlist_c.addFilterSmall(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist_c.addFilterBig(param1, param2) end

---@param param1 number
function serverlist_c.addFilterSpace(param1) end

function serverlist_c.removeFilterOptions() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
function serverlist_c.addFilterOption(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
function serverlist_c.setFilterOption(param1, param2) end

---@param param1 number
---@param param2 string
function serverlist_c.setFilterOptionString(param1, param2) end

function serverlist_c.updateFilterList() end

function serverlist_c.clearFilters() end

---@return number
function serverlist_c.getTabCount() end

---@param param1 number
---@param param2 boolean
function serverlist_c.setVoiceChatIcons(param1, param2) end

---@class UIRoot_skills: FlashObject @skills
---@field dragHit_mc FlashObject
---@field memoryPageHitRect_mc FlashObject
---@field skillPane_mc FlashObject
---@field skillPreview_mc FlashObject
---@field events FlashArray
---@field layout string
---@field _isDragging boolean
---@field hasTooltip boolean
---@field isInCombat boolean
---@field memoryAmount number
---@field memoryUsed number
---@field memoryCommitted FlashArray
---@field skillsUpdateList FlashArray
---@field skillsCoolDownList FlashArray
---@field memoryText FlashArray
---@field memoryListTitle FlashArray
---@field memoryHeaderTitle FlashArray
---@field tabTooltip FlashArray
---@field skillsColors FlashArray
---@field skillListTitle string
---@field defaultDeck string
---@field draggingSkillId string
---@field draggingSkillSchool number
---@field draggingSkillMemory number
---@field filterButtons FlashObject
---@field charIconW number
---@field charIconH number
---@field skillSize number
---@field deafultSkillSize number
---@field skillSpacing number
---@field memorySpacing number
---@field listSpacing number
---@field amountOfColumns number
---@field extraMemorySpacing number
---@field extraMemorySize number
---@field memoryListSpacing number
---@field memoryVerticalSpacing number
---@field memoryHorizintalSpacing number
---@field filterBGSpacing number
---@field buttonCallBack FlashArray
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field tooltipId string
---@field tooltipHideTimer FlashObject
skills = {}

function skills.MainTimeline() end

---@return FlashObject
function skills.clearDragging() end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 number
---@param param6 number
---@return FlashObject
function skills.showTooltip(param1, param2, param3, param4, param5, param6) end

---@return FlashObject
function skills.hideTooltip() end

---@param param1 FlashObject
---@return FlashObject
function skills.onTooltipTimerComplete(param1) end

---@return FlashObject
function skills.showSkillPreview() end

---@return FlashObject
function skills.hideSkillPreview() end

function skills.onEventInit() end

---@param param1 number
function skills.onEventUp(param1) end

---@param param1 number
function skills.onEventDown(param1) end

---@param param1 string
---@param param2 string
function skills.setTitle(param1, param2) end

---@param param1 number
---@param param2 string
function skills.setButtonText(param1, param2) end

---@param param1 string
function skills.setMemoryText(param1) end

---@param param1 number
---@param param2 boolean
function skills.setPlayer(param1, param2) end

---@param param1 number
function skills.setPlayerMemory(param1) end

---@param param1 number
function skills.addFilter(param1) end

---@param param1 boolean
function skills.updateSkills(param1) end

function skills.selectAllFilters() end

function skills.forceUpdate() end

function skills.updateMemory() end

function skills.resetFilters() end

function skills.updateCooldowns() end

---@param param1 string
function skills.selectSkillByID(param1) end

---@return FlashObject
function skills.showMemoryHighlight() end

---@return FlashObject
function skills.hideMemoryHighlight() end

---@param param1 FlashObject
---@return FlashObject
function skills.updateMemoryHighlight(param1) end

---@class UIRoot_skillsSelection: FlashObject @skillsSelection
---@field skills_mc FlashObject
---@field skillIconSize number
---@field listSpacing number
---@field iconSpacingH number
---@field iconSpacingV number
---@field numberOfCols number
---@field chosenListSpacing number
---@field numberOfSlots number
---@field events FlashArray
---@field layout string
---@field isDragging boolean
---@field characterHandle number
---@field chosenSkillsList FlashArray
---@field skillsUpdateList FlashArray
---@field skillsCoolDownList FlashArray
---@field skillSchoolString FlashArray
---@field inUseStr string
---@field noSkills string
---@field topTitle string
---@field bottomTitle string
---@field hasTooltip boolean
---@field curTooltip number
---@field labels_array FlashArray
skillsSelection = {}

function skillsSelection.MainTimeline() end

---@param param1 number
function skillsSelection.onEventUp(param1) end

---@param param1 number
function skillsSelection.onEventDown(param1) end

function skillsSelection.onEventTerminate() end

function skillsSelection.onEventInit() end

---@param param1 number
---@param param2 string
function skillsSelection.setLabels(param1, param2) end

---@param param1 number
---@param param2 string
function skillsSelection.setBtnText(param1, param2) end

---@param param1 string
function skillsSelection.setInUseString(param1) end

function skillsSelection.clearSkills() end

---@param param1 number
function skillsSelection.selectTab(param1) end

function skillsSelection.updateSkills() end

function skillsSelection.updateChosenSkills() end

function skillsSelection.clearChosenSkills() end

function skillsSelection.updateCooldowns() end

---@param param1 number
---@param param2 string
---@param param3 number
function skillsSelection.addTab(param1, param2, param3) end

---@param param1 number
---@param param2 number
function skillsSelection.setTabMaxAmount(param1, param2) end

---@param param1 boolean
function skillsSelection.useUnlearnButtons(param1) end

---@param param1 number
function skillsSelection.setCurrentAP(param1) end

---@class UIRoot_sortBy_c: FlashObject @sortBy_c
---@field sortBy_mc FlashObject
---@field events FlashArray
---@field layout string
---@field hideTimeline FlashObject
---@field anchorPlId number
---@field sortList FlashObject
---@field downEvent string
---@field hiddenX number
---@field hiddenY number
---@field hiddenAlpha number
---@field animating boolean
sortBy_c = {}

function sortBy_c.MainTimeline() end

function sortBy_c.onEventResize() end

---@param param1 number
function sortBy_c.onEventUp(param1) end

---@param param1 number
function sortBy_c.onEventDown(param1) end

function sortBy_c.onEventInit() end

function sortBy_c.fadeIn() end

function sortBy_c.closeUI() end

function sortBy_c.openFinished() end

function sortBy_c.closeFinished() end

---@param param1 number
function sortBy_c.setAnchor(param1) end

---@param param1 string
function sortBy_c.setTitle(param1) end

function sortBy_c.show() end

function sortBy_c.hide() end

---@param param1 FlashObject
---@return FlashObject
function sortBy_c.removeChildrenOf(param1) end

function sortBy_c.clearItems() end

---@param param1 number
---@param param2 string
function sortBy_c.addSortOption(param1, param2) end

---@param param1 number
---@param param2 string
function sortBy_c.addBtnHint(param1, param2) end

function sortBy_c.clearBtnHints() end

---@class UIRoot_startTurnRequest: FlashObject @startTurnRequest
---@field playerName_mc FlashObject
---@field startTurn_mc FlashObject
---@field layout string
---@field events FlashArray
---@field ELabel_HintPart1 number
---@field ELabel_HintPart2 number
---@field ELabel_HoldPart number
---@field ELabel_PlayerName number
startTurnRequest = {}

function startTurnRequest.MainTimeline() end

---@param param1 number
function startTurnRequest.onEventUp(param1) end

---@param param1 number
function startTurnRequest.onEventDown(param1) end

function startTurnRequest.onEventInit() end

---@param param1 number
---@param param2 string
function startTurnRequest.setLabel(param1, param2) end

function startTurnRequest.showStartTurnHint() end

function startTurnRequest.startTurn() end

function startTurnRequest.hideOnStartTurn() end

function startTurnRequest.hideStartTurnHint() end

function startTurnRequest.resetStartTurnHold() end

---@param param1 FlashObject
---@return FlashObject
function startTurnRequest.getGlobalPositionOfMC(param1) end

---@param param1 FlashObject
---@param param2 number
---@return FlashObject
function startTurnRequest.changeColour(param1, param2) end

---@param param1 string
---@param param2 string
---@return boolean
function startTurnRequest.startsWith(param1, param2) end

---@class UIRoot_startTurnRequest_c: FlashObject @startTurnRequest_c
---@field playerName_mc FlashObject
---@field startTurn_mc FlashObject
---@field layout string
---@field events FlashArray
---@field ELabel_HintPart1 number
---@field ELabel_HintPart2 number
---@field ELabel_HoldPart number
---@field ELabel_PlayerName number
startTurnRequest_c = {}

function startTurnRequest_c.MainTimeline() end

---@param param1 number
function startTurnRequest_c.onEventUp(param1) end

---@param param1 number
function startTurnRequest_c.onEventDown(param1) end

function startTurnRequest_c.onEventInit() end

---@param param1 number
function startTurnRequest_c.setAnchor(param1) end

---@param param1 number
---@param param2 string
function startTurnRequest_c.setLabel(param1, param2) end

function startTurnRequest_c.showStartTurnHint() end

function startTurnRequest_c.startTurn() end

function startTurnRequest_c.hideOnStartTurn() end

function startTurnRequest_c.hideStartTurnHint() end

function startTurnRequest_c.resetStartTurnHold() end

---@param param1 FlashObject
---@return FlashObject
function startTurnRequest_c.getGlobalPositionOfMC(param1) end

---@param param1 FlashObject
---@param param2 number
---@return FlashObject
function startTurnRequest_c.changeColour(param1, param2) end

---@param param1 string
---@param param2 string
---@return boolean
function startTurnRequest_c.startsWith(param1, param2) end

---@class UIRoot_statsPanel_c: FlashObject @statsPanel_c
---@field mainpanel_mc FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isDragging boolean
---@field curTooltip number
---@field hasTooltip boolean
---@field invCellSize number
---@field invCellSpacing number
---@field invBgDiscrap number
---@field invRows number
---@field invCols number
---@field charIconW number
---@field charIconH number
---@field ability_array FlashArray
---@field tags_array FlashArray
---@field talent_array FlashArray
---@field infoStat_array FlashArray
---@field lvlBtnAbility_array FlashArray
---@field lvlBtnStat_array FlashArray
---@field lvlBtnTalent_array FlashArray
---@field customStats_array FlashArray
---@field tooltipArray FlashArray
---@field text_array FlashArray
---@field initDone boolean
---@field hasCanceled boolean
---@field tooltipTw FlashObject
---@field s_disabledTooltipAlpha number
---@field s_TooltipTween number
---@field status_array FlashArray
---@field oldId number
statsPanel_c = {}

function statsPanel_c.MainTimeline() end

function statsPanel_c.onEventResize() end

---@param param1 number
function statsPanel_c.onEventDown(param1) end

---@param param1 number
function statsPanel_c.onEventUp(param1) end

---@param param1 string
function statsPanel_c.setPanelTitle(param1) end

function statsPanel_c.onEventInit() end

---@param param1 number
function statsPanel_c.setAnchor(param1) end

---@param param1 number
---@param param2 boolean
function statsPanel_c.setPlayer(param1, param2) end

---@param param1 boolean
function statsPanel_c.setHLOnRT(param1) end

---@param param1 boolean
function statsPanel_c.setHLOnLT(param1) end

function statsPanel_c.clearTooltip() end

function statsPanel_c.enableTooltip() end

---@param param1 string
---@param param2 string
---@param param3 boolean
function statsPanel_c.setTooltip(param1, param2, param3) end

function statsPanel_c.showTooltip() end

---@param param1 number
---@param param2 string
function statsPanel_c.setText(param1, param2) end

function statsPanel_c.resetReputationPos() end

---@param param1 number
---@param param2 string
---@param param3 number
function statsPanel_c.addBtnHint(param1, param2, param3) end

function statsPanel_c.clearBtnHints() end

---@param param1 number
function statsPanel_c.showPanel(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 number
---@param param6 number
function statsPanel_c.addInfoStat(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 string
function statsPanel_c.setInfoStatValue(param1, param2) end

---@param param1 number
---@param param2 number
function statsPanel_c.addInfoStatSpacing(param1, param2) end

function statsPanel_c.clearInfoStats() end

---@param param1 number
---@param param2 string
---@param param3 string
function statsPanel_c.setExperience(param1, param2, param3) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
function statsPanel_c.setNextLevelStats(param1, param2, param3, param4) end

---@param param1 number
---@param param2 string
function statsPanel_c.setStatPoints(param1, param2) end

---@param param1 number
---@param param2 boolean
function statsPanel_c.showBreadcrumb(param1, param2) end

---@param param1 boolean
function statsPanel_c.setPointAssignMode(param1) end

---@param param1 number
function statsPanel_c.selectTab(param1) end

---@param param1 boolean
function statsPanel_c.updateStatuses(param1) end

---@param param1 boolean
function statsPanel_c.selectFirstStatus(param1) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 string
---@param param6 number
---@param param7 string
function statsPanel_c.setStatus(param1, param2, param3, param4, param5, param6, param7) end

function statsPanel_c.clearStatuses() end

function statsPanel_c.updateArraySystem() end

---@param param1 number
function statsPanel_c.setAmountOfPlayers(param1) end

---@param param1 boolean
---@param param2 number
---@param param3 number
---@param param4 string
---@param param5 string
---@param param6 number
function statsPanel_c.addAbility(param1, param2, param3, param4, param5, param6) end

function statsPanel_c.removeAbilities() end

---@param param1 boolean
---@param param2 number
---@param param3 string
function statsPanel_c.addAbilityGroup(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 number
function statsPanel_c.addTalent(param1, param2, param3) end

function statsPanel_c.removeTalents() end

---@param param1 string
---@param param2 string
---@param param3 number
---@param param4 number
---@param param5 number
function statsPanel_c.addTag(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 string
---@param param3 string
function statsPanel_c.addCustomStat(param1, param2, param3) end

function statsPanel_c.clearCustomStats() end

function statsPanel_c.clearTags() end

---@param param1 number
---@param param2 number
---@param param3 string
function statsPanel_c.addStatsTab(param1, param2, param3) end

function statsPanel_c.removeStatsTabs() end

---@param param1 number
function statsPanel_c.selectStatsTab(param1) end

---@param param1 string
---@param param2 string
---@param param3 string
function statsPanel_c.setMainInfoStats(param1, param2, param3) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 boolean
---@param param5 number
function statsPanel_c.setAttribute(param1, param2, param3, param4, param5) end

---@param param1 number
---@param param2 string
function statsPanel_c.setAttributeLabel(param1, param2) end

---@param param1 boolean
function statsPanel_c.setActionsDisabled(param1) end

---@param param1 string
---@param param2 string
---@return boolean
function statsPanel_c.startsWith(param1, param2) end

---@class UIRoot_statusConsole: FlashObject @statusConsole
---@field console_mc FlashObject
---@field fightButtons_mc FlashObject
---@field toGM_mc FlashObject
---@field turnNotice_mc FlashObject
---@field bottomBarHeight number
---@field YOffset number
---@field fleeX number
---@field guardX number
---@field endTurnX number
---@field endTurnY number
---@field fleeY number
---@field guardY number
---@field apX number
---@field apY number
---@field mabTxtPosX number
---@field abTxtPosX number
---@field twoArmourBars boolean
---@field originalConsolePosY number
---@field layout string
---@field defaultHPColour number
---@field events FlashArray
---@field armourUpdateArray FlashArray
---@field armourIsAnimating boolean
---@field notifTweenTime number
---@field notificationOffset number
---@field upScaled number
---@field notifTween FlashObject
---@field scaleXTween FlashObject
---@field scaleYTween FlashObject
---@field oldTurnNotification number
---@field btn_array FlashArray
---@field cacheHealthAnim FlashArray
---@field showTurnTimer boolean
statusConsole = {}

function statusConsole.MainTimeline() end

function statusConsole.onEventInit() end

function statusConsole.backToGM() end

function statusConsole.onIcoOver() end

function statusConsole.onIcoOut() end

function statusConsole.onIcoDown() end

function statusConsole.updateArmourBar() end

---@param param1 number
function statusConsole.onEventUp(param1) end

---@param param1 number
function statusConsole.onEventDown(param1) end

function statusConsole.resetHPColour() end

---@param param1 number
function statusConsole.setHPColour(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
function statusConsole.setHealth(param1, param2, param3) end

function statusConsole.executeCachedHealth() end

---@param param1 number
function statusConsole.setMaxAp(param1) end

---@param param1 number
function statusConsole.setActiveAp(param1) end

---@param param1 number
function statusConsole.setAvailableAp(param1) end

---@param param1 number
function statusConsole.setBonusAP(param1) end

---@param param1 number
function statusConsole.setGreyAP(param1) end

---@param param1 FlashObject
function statusConsole.showTooltipForMC(param1) end

---@param param1 number
---@param param2 string
function statusConsole.setBtnText(param1, param2) end

---@param param1 number
---@param param2 string
function statusConsole.setBtnTooltip(param1, param2) end

---@param param1 number
---@param param2 boolean
function statusConsole.setBtnDisabled(param1, param2) end

---@param param1 number
---@param param2 boolean
function statusConsole.setBtnVisible(param1, param2) end

---@param param1 number
function statusConsole.setSourcePoints(param1) end

---@param param1 number
---@param param2 string
---@param param3 boolean
---@param param4 boolean
function statusConsole.setCombatTurnNotification(param1, param2, param3, param4) end

---@param param1 number
function statusConsole.setTurnTimer(param1) end

function statusConsole.INTStopNotifTweens() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function statusConsole.showNotification(param1, param2, param3) end

function statusConsole.yourTurnAnimation() end

function statusConsole.TurnNoticeAnimDone() end

---@param param1 boolean
function statusConsole.setOverrideEndTurn(param1) end

---@class UIRoot_storyElement: FlashObject @storyElement
---@field hint_mc FlashObject
---@field events FlashArray
---@field layout string
---@field curTooltip number
---@field hasTooltip boolean
---@field controllerMode boolean
---@field isDragging boolean
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field downEventId number
storyElement = {}

function storyElement.MainTimeline() end

function storyElement.onEventResize() end

---@param param1 number
function storyElement.onEventDown(param1) end

---@param param1 number
function storyElement.onEventUp(param1) end

function storyElement.onEventInit() end

---@param param1 number
function storyElement.setAnchor(param1) end

---@param param1 string
function storyElement.setHintText(param1) end

---@param param1 boolean
function storyElement.setControllerMode(param1) end

---@class UIRoot_subtitles: FlashObject @subtitles
---@field hintHolder_mc FlashObject
---@field iggy_video FlashObject
---@field subtitle_mc FlashObject
---@field events FlashArray
---@field layout string
---@field frame_width number
---@field frame_height number
---@field frameSpacing number
---@field subtitleCenterY number
---@field btnHelper FlashObject
---@field hintShowAmount number
---@field hintShowTweenTime number
---@field hintShowCount number
---@field hintBusy boolean
---@field hintShowTimeLine FlashObject
---@field textAlignStr string
---@field myText string
subtitles = {}

function subtitles.MainTimeline() end

---@param param1 number
---@param param2 number
function subtitles.setWindow(param1, param2) end

function subtitles.onEventResize() end

---@param param1 number
---@return boolean
function subtitles.onEventUp(param1) end

---@param param1 number
---@return boolean
function subtitles.onEventDown(param1) end

---@param param1 string
function subtitles.setHintText(param1) end

function subtitles.showHint() end

function subtitles.hintTweenDone() end

function subtitles.stopHintTween() end

function subtitles.onEventInit() end

---@param param1 string
function subtitles.setText(param1) end

---@param param1 string
function subtitles.addText(param1) end

function subtitles.centerText() end

---@class UIRoot_textDisplay: FlashObject @textDisplay
---@field tooltip_mc FlashObject
---@field events FlashArray
---@field layout string
---@field timeline FlashObject
---@field frameSpacing number
---@field tf FlashObject
---@field glMaxTextWidth number
---@field textOffsetX number
---@field textOffsetY number
---@field maxTextWidth number
---@field shared boolean
---@field isController boolean
---@field label_array FlashArray
---@field tooltipArray FlashArray
---@field padding number
---@field offsetYBottom number
textDisplay = {}

function textDisplay.MainTimeline() end

---@param param1 number
---@param param2 number
function textDisplay.setWindow(param1, param2) end

function textDisplay.onEventInit() end

---@param param1 number
function textDisplay.setAnchor(param1) end

---@param param1 boolean
function textDisplay.setFullScreen(param1) end

function textDisplay.onEventResize() end

---@param param1 number
---@return FlashObject
function textDisplay.getLabel(param1) end

---@param param1 number
function textDisplay.removeLabel(param1) end

function textDisplay.clearLabels() end

---@param param1 number
---@param param2 string
---@param param3 number
---@param param4 number
function textDisplay.addLabel(param1, param2, param3, param4) end

function textDisplay.initTFMC() end

---@param param1 string
---@param param2 number
---@param param3 number
function textDisplay.addText(param1, param2, param3) end

---@param param1 number
---@param param2 number
function textDisplay.displaySurfaceText(param1, param2) end

---@param param1 number
---@param param2 number
function textDisplay.moveText(param1, param2) end

function textDisplay.clearTooltipText() end

---@param param1 FlashObject
function textDisplay.onMove(param1) end

function textDisplay.removeText() end

---@param param1 number
---@param param2 number
function textDisplay.fadeOutText(param1, param2) end

---@param param1 FlashObject
---@param param2 number
---@param param3 number
function textDisplay.checkTextBoundaries(param1, param2, param3) end

---@param param1 boolean
function textDisplay.setUIType(param1) end

---@class UIRoot_tooltip: FlashObject @tooltip
---@field tooltip_mc FlashObject
---@field events FlashArray
---@field layout string
---@field cachedStickToMouse number
---@field cEquippedSpacing number
---@field ComparePaneOffset number
---@field ComparePaneOffset2 number
---@field ComparePaneOffset3 number
---@field desWidth number
---@field desHeight number
---@field frame_width number
---@field frame_height number
---@field frameSpacing number
---@field tf FlashObject
---@field ctf FlashObject
---@field ohctf FlashObject
---@field glMaxTooltipWidth number
---@field ydispForCompareheader number
---@field offsetX number
---@field offsetY number
---@field textColour number
---@field bgColour number
---@field compareShowTimer FlashObject
---@field compareMode boolean
---@field tooltipModeTimer FlashObject
---@field tooltip_array FlashArray
---@field tooltipCompare_array FlashArray
---@field tooltipOffHand_array FlashArray
---@field formatTooltip FlashObject
---@field compareTooltip FlashObject
---@field offhandTooltip FlashObject
---@field defaultTooltip FlashObject
---@field statusTooltip FlashObject
---@field NormalTooltip boolean
---@field isStatusTT boolean
---@field tweenInTime number
---@field tooltipAlignmentLeft boolean
tooltip = {}

function tooltip.MainTimeline() end

---@param param1 number
---@param param2 string
---@return FlashObject
function tooltip.setGroupLabel(param1, param2) end

---@param param1 number
---@param param2 number
function tooltip.setWindow(param1, param2) end

function tooltip.onEventInit() end

function tooltip.onEventResize() end

---@param param1 string
---@param param2 string
---@param param3 string
---@return string
function tooltip.strReplace(param1, param2, param3) end

---@param param1 FlashArray
function tooltip.traceArray(param1) end

---@param param1 number
---@param param2 number
---@param param3 boolean
function tooltip.addFormattedTooltip(param1, param2, param3) end

---@param param1 number
---@param param2 number
function tooltip.addStatusTooltip(param1, param2) end

---@param param1 string
---@param param2 number
---@param param3 number
---@param param4 boolean
---@param param5 number
---@param param6 number
function tooltip.addTooltip(param1, param2, param3, param4, param5, param6) end

function tooltip.swapCompare() end

---@param param1 boolean
function tooltip.showFormattedTooltipAfterPos(param1) end

---@param param1 boolean
function tooltip.setCompare(param1) end

---@param param1 FlashArray
---@param param2 number
---@param param3 number
function tooltip.addCompareTooltip(param1, param2, param3) end

---@param param1 FlashArray
---@param param2 number
---@param param3 number
function tooltip.addCompareOffhandTooltip(param1, param2, param3) end

function tooltip.INTshowTooltip() end

---@param param1 FlashObject
function tooltip.onShowCompareTooltip(param1) end

function tooltip.startModeTimer() end

---@param param1 FlashObject
function tooltip.resetTooltipMode(param1) end

---@param param1 FlashObject
function tooltip.onMove(param1) end

function tooltip.INTRemoveTooltip() end

function tooltip.removeTooltip() end

---@param param1 number
---@param param2 number
function tooltip.fadeOutTooltip(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
function tooltip.checkTooltipBoundaries(param1, param2, param3, param4) end

---@return number
function tooltip.getTooltipHeight() end

---@return number
function tooltip.getTooltipWidth() end

---@class UIRoot_tooltipHelper: FlashObject @tooltipHelper
---@field test_mc FlashObject
---@field tooltipW_mc FlashObject
---@field test FlashArray
tooltipHelper = {}

function tooltipHelper.MainTimeline() end

---@class UIRoot_tooltipHelper_kb: FlashObject @tooltipHelper_kb
---@field test_mc FlashObject
---@field test FlashArray
tooltipHelper_kb = {}

function tooltipHelper_kb.MainTimeline() end

---@class UIRoot_trade: FlashObject @trade
---@field trade_mc FlashObject
---@field events FlashArray
---@field layout string
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field items_array FlashArray
---@field charList_array FlashArray
---@field isDragging boolean
---@field curTooltipList number
---@field curTooltip string
---@field hasTooltip boolean
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field sortBy_array FlashArray
---@field text_array FlashArray
trade = {}

function trade.MainTimeline() end

function trade.addSortDropDownEntries() end

function trade.onEventResize() end

---@param param1 number
function trade.onEventDown(param1) end

---@param param1 number
function trade.onEventUp(param1) end

function trade.updateItems() end

function trade.updateCharList() end

---@param param1 number
function trade.selectCharacter(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
function trade.tweenItem(param1, param2, param3, param4) end

---@param param1 string
function trade.setButtonTxt(param1) end

function trade.clearSlots() end

---@param param1 string
---@param param2 number
function trade.setTraderText(param1, param2) end

---@param param1 boolean
function trade.setTraderTextVisible(param1) end

function trade.onEventInit() end

function trade.onEventTerminate() end

---@param param1 string
---@param param2 string
---@return boolean
function trade.startsWith(param1, param2) end

---@param param1 number
---@param param2 string
function trade.setText(param1, param2) end

---@param param1 number
---@param param2 string
function trade.setTooltip(param1, param2) end

---@param param1 string
function trade.setWeight(param1) end

---@param param1 string
function trade.setDropDownLabel(param1) end

---@param param1 number
---@param param2 string
function trade.addSortDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 string
function trade.setSortDropDownText(param1, param2) end

---@param param1 number
---@param param2 number
function trade.selectSortDropDownEntry(param1, param2) end

---@param param1 number
---@param param2 boolean
function trade.setSortDropDownEnabled(param1, param2) end

---@param param1 string
function trade.setTitle(param1) end

---@param param1 FlashObject
---@param param2 string
function trade.showTooltipForMC(param1, param2) end

---@param param1 FlashObject
---@return FlashObject
function trade.getGlobalPositionOfMC(param1) end

---@param param1 number
---@param param2 string
function trade.setGoldValues(param1, param2) end

---@param param1 boolean
function trade.showWindowBar(param1) end

---@param param1 number
function trade.selectUICharacter(param1) end

---@param param1 number
function trade.setWindowBarWidth(param1) end

function trade.resetWindowBar() end

---@param param1 number
function trade.disableTraderTab(param1) end

---@param param1 boolean
function trade.disableAcceptBtn(param1) end

---@param param1 boolean
function trade.disableRepairBtn(param1) end

---@param param1 boolean
function trade.disableIdBtn(param1) end

---@param param1 boolean
function trade.setLock(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function trade.addTab(param1, param2, param3) end

function trade.clearTabs() end

function trade.clearTraderTabs() end

---@param param1 number
function trade.selectTab(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function trade.addTraderTab(param1, param2, param3) end

---@param param1 number
function trade.selectTraderTab(param1) end

---@class UIRoot_trade_c: FlashObject @trade_c
---@field trade_mc FlashObject
---@field allowSound boolean
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isSplit boolean
---@field charIconHeight number
---@field charIconWidth number
---@field invCellSize number
---@field invCellSpacing number
---@field invCellBgSizeDiff number
---@field invBgDiscrap number
---@field invRows number
---@field cols number
---@field barterOfferRows number
---@field barterOfferColumns number
---@field barterInvRows number
---@field barterInvColumns number
---@field itemsUpdateList FlashArray
---@field barterItems_array FlashArray
---@field menuItemsUpdateList FlashArray
---@field gotDetailsEvent boolean
---@field initDone boolean
---@field holdingA boolean
---@field holdTimer FlashObject
---@field timerActive boolean
---@field attX number
---@field attY number
---@field canToggleTooltips boolean
---@field hasTooltipEnabled boolean
---@field tooltipTweenTime number
---@field offerWaresTimer FlashObject
---@field canBalance boolean
---@field currentComp number
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field tooltip_array FlashArray
---@field tooltipCompare_array FlashArray
---@field equipOffhandTooltip_array FlashArray
---@field tooltipHandle number
---@field tooltipAmount number
---@field TTimer FlashObject
trade_c = {}

function trade_c.MainTimeline() end

---@param param1 FlashObject
function trade_c.timerDone(param1) end

function trade_c.holdTimerStop() end

---@param param1 number
function trade_c.onEventDown(param1) end

---@param param1 number
function trade_c.onEventUp(param1) end

function trade_c.playAnim() end

---@param param1 string
function trade_c.setOffhandString(param1) end

---@param param1 number
---@param param2 string
function trade_c.setTooltipGroupLabel(param1, param2) end

---@param param1 string
function trade_c.tooltipEquippedString(param1) end

---@param param1 number
---@param param2 string
function trade_c.setTooltipCompareHint(param1, param2) end

function trade_c.clearTooltipCompareHints() end

function trade_c.updateTooltip() end

---@param param1 boolean
---@param param2 boolean
function trade_c.hideTooltip(param1, param2) end

---@param param1 boolean
function trade_c.showTooltip(param1) end

function trade_c.clearTooltip() end

---@param param1 boolean
function trade_c.tooltipTweenDone(param1) end

---@param param1 number
---@param param2 number
function trade_c.INV_ShowCellTooltip(param1, param2) end

---@param param1 FlashObject
function trade_c.INV_SendTooltipRequest(param1) end

function trade_c.INV_ClearTooltipRequest() end

function trade_c.onEventInit() end

---@param param1 FlashObject
function trade_c.offerWaresStartHold(param1) end

---@param param1 number
function trade_c.setAnchor(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
function trade_c.addInventoryFilter(param1, param2, param3) end

function trade_c.removeInventoryFilters() end

---@param param1 number
function trade_c.selectInventoryFilter(param1) end

---@param param1 number
---@param param2 boolean
function trade_c.setPlayer(param1, param2) end

---@param param1 number
---@param param2 string
function trade_c.setLabel(param1, param2) end

---@param param1 number
---@param param2 string
function trade_c.setGoldValues(param1, param2) end

---@param param1 number
---@param param2 string
function trade_c.setBarterTxt(param1, param2) end

function trade_c.updateMenuItems() end

function trade_c.updateItems() end

function trade_c.onSwitchChar() end

---@param param1 number
---@param param2 string
---@param param3 number
function trade_c.addBtnHint(param1, param2, param3) end

function trade_c.clearBtnHints() end

function trade_c.clearSlots() end

---@param param1 string
---@param param2 number
function trade_c.setTraderText(param1, param2) end

---@param param1 boolean
function trade_c.subTabsActive(param1) end

function trade_c.pressedConfirmOffer() end

function trade_c.releasedConfirmOffer() end

---@class UIRoot_tutorialBox: FlashObject @tutorialBox
---@field arrowModal_mc FlashObject
---@field arrow_mc FlashObject
---@field modalPointer_mc FlashObject
---@field nonModalHolder_mc FlashObject
---@field nonModalPointer_mc FlashObject
---@field tutorialBox_mc FlashObject
---@field pointerNonModalTimeline FlashObject
---@field modalTimeline FlashObject
---@field pointerModalTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isOkCancel boolean
---@field buttonText string
---@field allowCancel boolean
---@field modalPopupWidth number
---@field modalPopupHeight number
---@field beginPosX number
---@field beginPosY number
---@field endPosX number
---@field endPosY number
---@field modalBoxVisible boolean
---@field modalPointerVisible boolean
---@field m_isCharacterCreation boolean
---@field nonModalList FlashObject
---@field nonModalPopupDuration number
---@field nonModalPointerStartHeight number
---@field m_NonModalPointerActive boolean
---@field frame_width number
---@field frame_height number
---@field xRoot number
---@field tutorialBoxBgWidth number
---@field pointerBGW number
---@field fadeOutY number
tutorialBox = {}

function tutorialBox.MainTimeline() end

function tutorialBox.onEventResize() end

---@param param1 number
---@param param2 number
function tutorialBox.setWindow(param1, param2) end

---@param param1 number
---@return boolean
function tutorialBox.onEventUp(param1) end

function tutorialBox.onEventInit() end

function tutorialBox.xcloseBtnFunc() end

---@param param1 number
---@return boolean
function tutorialBox.onEventDown(param1) end

---@param param1 boolean
function tutorialBox.setCheckboxVisible(param1) end

---@param param1 string
function tutorialBox.setCheckboxLabel(param1) end

---@param param1 number
function tutorialBox.setCheckboxState(param1) end

---@return number
function tutorialBox.getHeight() end

---@return number
function tutorialBox.getWidth() end

---@param param1 number
---@return FlashObject
function tutorialBox.setX(param1) end

---@param param1 number
---@return FlashObject
function tutorialBox.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function tutorialBox.setPos(param1, param2) end

---@return number
function tutorialBox.getX() end

---@return number
function tutorialBox.getY() end

---@param param1 string
---@param param2 number
---@param param3 number
---@param param4 number
function tutorialBox.fadeInNonModalPointer(param1, param2, param3, param4) end

function tutorialBox.fadeOutNonModalPointer() end

function tutorialBox.fadeOutNonModalPointerDone() end

---@param param1 boolean
function tutorialBox.showNonModals(param1) end

function tutorialBox.stopNonModalPointerTween() end

function tutorialBox.stopModalPointerTween() end

function tutorialBox.stopModalTween() end

---@param param1 boolean
function tutorialBox.setIsCharacterCreation(param1) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 string
function tutorialBox.addNonModalBox(param1, param2, param3, param4) end

---@param param1 number
function tutorialBox.calcTutBoxAlpha(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@return number
function tutorialBox.clamp(param1, param2, param3) end

---@param param1 string
function tutorialBox.removeNonModalBox(param1) end

---@param param1 FlashObject
function tutorialBox.doRemoveElement(param1) end

---@param param1 FlashObject
function tutorialBox.onNonModalBoxRemoved(param1) end

---@param param1 boolean
function tutorialBox.repositionModalHolder(param1) end

---@param param1 string
---@param param2 number
---@param param3 number
---@param param4 number
function tutorialBox.fadeInModalPointer(param1, param2, param3, param4) end

function tutorialBox.fadeOutModalPointer() end

function tutorialBox.fadeOutModalPointerDone() end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 number
---@param param5 number
function tutorialBox.fadeInModal(param1, param2, param3, param4, param5) end

function tutorialBox.fadeOutModal() end

function tutorialBox.fadeOutModalDone() end

---@param param1 number
---@param param2 number
---@return number
function tutorialBox.getAngle(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
function tutorialBox.addBtnHint(param1, param2, param3) end

function tutorialBox.clearBtnHints() end

---@class UIRoot_tutorialBox_c: FlashObject @tutorialBox_c
---@field arrowModal_mc FlashObject
---@field arrow_mc FlashObject
---@field modalPointer_mc FlashObject
---@field nonModalHolder_mc FlashObject
---@field nonModalPointer_mc FlashObject
---@field tutorialBox_mc FlashObject
---@field pointerTimelineY FlashObject
---@field pointerTimelineA FlashObject
---@field pointerTimelineScaleX FlashObject
---@field pointerTimelineScaleY FlashObject
---@field modalTimelineA FlashObject
---@field modalTimelineScaleX FlashObject
---@field modalTimelineScaleY FlashObject
---@field popupTimelineA FlashObject
---@field popupTimelineScaleX FlashObject
---@field popupTimelineScaleY FlashObject
---@field tutBoxTimelineA FlashObject
---@field tutBoxTimelineScaleX FlashObject
---@field tutBoxTimelineScaleY FlashObject
---@field modalFadeTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field isOkCancel boolean
---@field allowCancel boolean
---@field modalBoxVisible boolean
---@field modalPointerVisible boolean
---@field isSplitScreen boolean
---@field anchorregistered boolean
---@field nonModalList FlashObject
---@field onAcceptRelease FlashObject
---@field m_playerId number
---@field nonModalPopupDuration number
---@field tradeAttX number
---@field tradeAttY number
---@field armorDollX number
---@field armorDollY number
---@field m_AmountOfPlayers number
---@field FadeOutTweenTime number
---@field FadeInTweenTime number
---@field FadeOutScale number
---@field tMaxH number
---@field m_shared boolean
---@field frame_width number
---@field frame_height number
---@field xRoot number
tutorialBox_c = {}

function tutorialBox_c.MainTimeline() end

---@param param1 number
---@param param2 number
---@param param3 boolean
function tutorialBox_c.setWindow(param1, param2, param3) end

---@param param1 boolean
---@param param2 boolean
function tutorialBox_c.setSharedMode(param1, param2) end

function tutorialBox_c.onEventResize() end

---@param param1 number
---@return boolean
function tutorialBox_c.onEventUp(param1) end

---@param param1 number
---@return boolean
function tutorialBox_c.onEventDown(param1) end

function tutorialBox_c.onEventInit() end

---@param param1 number
function tutorialBox_c.setAmountOfPlayers(param1) end

---@param param1 boolean
function tutorialBox_c.setIsCharacterCreation(param1) end

---@param param1 number
function tutorialBox_c.setAnchor(param1) end

---@param param1 boolean
function tutorialBox_c.setCheckboxVisible(param1) end

---@param param1 string
function tutorialBox_c.setCheckboxLabel(param1) end

---@param param1 number
function tutorialBox_c.setCheckboxState(param1) end

---@return number
function tutorialBox_c.getHeight() end

---@return number
function tutorialBox_c.getWidth() end

---@param param1 number
---@return FlashObject
function tutorialBox_c.setX(param1) end

---@param param1 number
---@return FlashObject
function tutorialBox_c.setY(param1) end

---@param param1 number
---@param param2 number
---@return FlashObject
function tutorialBox_c.setPos(param1, param2) end

---@return number
function tutorialBox_c.getX() end

---@return number
function tutorialBox_c.getY() end

---@param param1 string
---@param param2 number
---@param param3 number
---@param param4 number
function tutorialBox_c.fadeInNonModalPointer(param1, param2, param3, param4) end

function tutorialBox_c.INTSetNonModalPointerInScreen() end

function tutorialBox_c.clearNonModalTween() end

function tutorialBox_c.fadeOutNonModalPointer() end

function tutorialBox_c.fadeOutNonModalPointerDone() end

---@param param1 boolean
function tutorialBox_c.showNonModals(param1) end

---@param param1 boolean
function tutorialBox_c.nonModalFadeDone(param1) end

---@param param1 string
---@param param2 string
---@param param3 string
---@param param4 string
function tutorialBox_c.addNonModalBox(param1, param2, param3, param4) end

---@param param1 number
function tutorialBox_c.calcTutBoxAlpha(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@return number
function tutorialBox_c.clamp(param1, param2, param3) end

---@param param1 string
function tutorialBox_c.removeNonModalBox(param1) end

---@param param1 FlashObject
function tutorialBox_c.onNonModalBoxRemoved(param1) end

---@param param1 boolean
function tutorialBox_c.repositionModalHolder(param1) end

---@param param1 string
---@param param2 number
---@param param3 number
---@param param4 number
function tutorialBox_c.fadeInModalPointer(param1, param2, param3, param4) end

function tutorialBox_c.INTSetModalPointerInScreen() end

function tutorialBox_c.clearModalPointer() end

function tutorialBox_c.fadeModalPointerDone() end

function tutorialBox_c.fadeOutModalPointer() end

function tutorialBox_c.fadeOutModalPointerDone() end

function tutorialBox_c.clearTutorialBoxTween() end

---@param param1 string
---@param param2 string
---@param param3 string
function tutorialBox_c.fadeInModal(param1, param2, param3) end

function tutorialBox_c.fadeOutModal() end

function tutorialBox_c.fadeModalDone() end

function tutorialBox_c.fadeOutModalDone() end

---@param param1 number
---@param param2 number
---@return number
function tutorialBox_c.getAngle(param1, param2) end

---@param param1 number
---@param param2 string
function tutorialBox_c.addNonModalBtnHint(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
function tutorialBox_c.addBtnHint(param1, param2, param3) end

function tutorialBox_c.clearBtnHints() end

function tutorialBox_c.moveHoldToSkip() end

---@class UIRoot_uiCraft: FlashObject @uiCraft
---@field craftPanel_mc FlashObject
---@field events FlashArray
---@field keepCustomInScreen boolean
---@field uiLeft number
---@field uiRight number
---@field uiTop number
---@field uiMinHeight number
---@field uiMinWidth number
---@field charIconW number
---@field charIconH number
---@field layout string
---@field ingredientCellSize number
---@field recipeIngredientCellSize number
---@field invCellSize number
---@field invCellSpacing number
---@field invBgDiscrap number
---@field invCellBgSizeDiff number
---@field invRows number
---@field invCols number
---@field invRuneRows number
---@field invRuneCols number
---@field allowSound boolean
---@field itemsUpdateList FlashArray
---@field runeslotUpdateList FlashArray
---@field IconWidth number
---@field IconHeight number
---@field recipeIconSize number
---@field recipeIconSpacing number
---@field makeSound boolean
---@field hasTooltip boolean
---@field disableActions boolean
---@field curTooltip number
---@field isDragging boolean
---@field draggingIngredient boolean
---@field runesPanelID number
---@field experimentPanelID number
---@field recipePanelID number
---@field sysPanelX number
---@field sysPanelY number
---@field sysPanelW number
---@field sysPanelH number
---@field runeTitleStr FlashObject
---@field runeSlotBtnInsertStr FlashObject
---@field runeSlotBtnExtractStr FlashObject
---@field text_array FlashArray
---@field recipe_array FlashArray
---@field recipeCount_array FlashArray
uiCraft = {}

function uiCraft.MainTimeline() end

function uiCraft.onEventResize() end

---@param param1 number
function uiCraft.onEventDown(param1) end

---@param param1 number
function uiCraft.onEventUp(param1) end

---@param param1 number
---@param param2 boolean
function uiCraft.setPlayer(param1, param2) end

function uiCraft.clearStation() end

---@param param1 string
---@param param2 boolean
function uiCraft.setStation(param1, param2) end

function uiCraft.onEventInit() end

function uiCraft.startCraft() end

function uiCraft.updateRuneSlots() end

---@param param1 number
---@param param2 number
function uiCraft.setCraftResultHandle(param1, param2) end

---@param param1 boolean
---@param param2 boolean
function uiCraft.setCraftInventoryPanelVisible(param1, param2) end

---@param param1 string
---@param param2 boolean
function uiCraft.setNoRuneWeaponsError(param1, param2) end

---@param param1 number
---@param param2 string
function uiCraft.setText(param1, param2) end

---@param param1 number
function uiCraft.setMaxIngredients(param1) end

---@param param1 number
function uiCraft.setMaxRecipeIngredients(param1) end

---@param param1 string
function uiCraft.setClosePopupButton(param1) end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 number
---@param param5 boolean
---@param param6 boolean
function uiCraft.setIngredient(param1, param2, param3, param4, param5, param6) end

---@param param1 number
function uiCraft.setRecipeMaxCraftAmount(param1) end

---@param param1 string
function uiCraft.setRecipeResult(param1) end

---@param param1 boolean
function uiCraft.setContainerMode(param1) end

---@param param1 number
---@param param2 boolean
function uiCraft.showBreadcrumb(param1, param2) end

---@param param1 number
function uiCraft.showCraftPanel(param1) end

function uiCraft.updateItems() end

---@param param1 number
function uiCraft.setInventorySlotSelection(param1) end

function uiCraft.clearSlots() end

---@param param1 string
---@param param2 boolean
function uiCraft.setResult(param1, param2) end

---@param param1 number
function uiCraft.setResultHandle(param1) end

function uiCraft.startCraftRecipe() end

---@param param1 number
function uiCraft.updateProgress(param1) end

function uiCraft.showResult() end

function uiCraft.cancelCraft() end

function uiCraft.updateArraySystem() end

---@param param1 number
---@param param2 number
---@param param3 string
---@param param4 string
---@param param5 string
---@param param6 boolean
function uiCraft.addRecipe(param1, param2, param3, param4, param5, param6) end

---@param param1 number
---@param param2 number
---@param param3 string
function uiCraft.setRecipeAmount(param1, param2, param3) end

function uiCraft.removeRecipes() end

---@param param1 number
---@param param2 string
function uiCraft.addRecipeGroup(param1, param2) end

---@param param1 number
---@param param2 string
function uiCraft.addTab(param1, param2) end

---@param param1 number
---@param param2 boolean
function uiCraft.setTabEnabled(param1, param2) end

---@param param1 number
---@param param2 number
---@param param3 string
function uiCraft.addFilterTab(param1, param2, param3) end

---@param param1 number
function uiCraft.selectFilterTab(param1) end

---@class UIRoot_uiFade: FlashObject @uiFade
---@field black_mc FlashObject
---@field fade_mc FlashObject
---@field CloseTimeline FlashObject
---@field events FlashArray
---@field layout string
---@field alignment string
---@field targetAlpha number
uiFade = {}

function uiFade.MainTimeline() end

---@param param1 FlashObject
function uiFade.captureMouseInput(param1) end

function uiFade.onEventResize() end

---@param param1 number
---@return boolean
function uiFade.onEventUp(param1) end

function uiFade.onEventInit() end

---@param param1 number
function uiFade.setAnchor(param1) end

---@param param1 number
---@return boolean
function uiFade.onEventDown(param1) end

---@param param1 boolean
function uiFade.setBlack(param1) end

---@param param1 number
function uiFade.setFadeAlpha(param1) end

---@param param1 number
function uiFade.fadeIn(param1) end

---@param param1 number
function uiFade.fadeOut(param1) end

function uiFade.fadeDone() end

---@class UIRoot_userProfile: FlashObject @userProfile
---@field userProfilesC_mc FlashObject
---@field userProfiles_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field timelineAlpha FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field isControllerMode boolean
---@field events FlashArray
---@field layout string
---@field oldEvent string
userProfile = {}

function userProfile.MainTimeline() end

function userProfile.onEventInit() end

function userProfile.onEventResize() end

---@param param1 number
---@return boolean
function userProfile.onEventUp(param1) end

---@param param1 number
---@return boolean
function userProfile.onEventDown(param1) end

---@return FlashObject
function userProfile.getUserProfileUI() end

function userProfile.next() end

function userProfile.previous() end

---@param param1 string
---@param param2 string
---@return boolean
function userProfile.startsWith(param1, param2) end

function userProfile.fadeIn() end

function userProfile.fadeOut() end

function userProfile.slideIn() end

function userProfile.requestClose() end

function userProfile.stopFadeTweens() end

---@param param1 boolean
function userProfile.setControllerMode(param1) end

---@param param1 number
---@param param2 string
---@param param3 number
function userProfile.addBtnHint(param1, param2, param3) end

function userProfile.clearBtnHints() end

function userProfile.requestHide() end

function userProfile.requestDestroy() end

---@param param1 number
---@param param2 string
function userProfile.setText(param1, param2) end

---@param param1 number
---@param param2 string
function userProfile.setButtonText(param1, param2) end

---@param param1 number
---@param param2 boolean
function userProfile.setButtonEnabled(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 string
function userProfile.addUserProfile(param1, param2, param3) end

function userProfile.sortList() end

---@param param1 number
---@param param2 boolean
function userProfile.setCurrentProfile(param1, param2) end

function userProfile.clearAll() end

---@param param1 number
function userProfile.selectProfile(param1) end

---@class UIRoot_voiceNotification_c: FlashObject @voiceNotification_c
---@field chatInfo1_mc FlashObject
---@field chatInfo2_mc FlashObject
---@field chatInfo3_mc FlashObject
---@field chatInfo4_mc FlashObject
---@field title1_txt FlashObject
---@field title2_txt FlashObject
---@field title3_txt FlashObject
---@field title4_txt FlashObject
---@field uiScaling number
---@field events FlashArray
---@field layout string
---@field leftUI boolean
voiceNotification_c = {}

function voiceNotification_c.MainTimeline() end

function voiceNotification_c.onEventInit() end

---@param param1 boolean
---@param param2 number
function voiceNotification_c.setChatIconVisible(param1, param2) end

---@param param1 string
---@param param2 number
function voiceNotification_c.setChatLabel(param1, param2) end

---@class UIRoot_watermark: FlashObject @watermark
---@field container_mc FlashObject
---@field events FlashArray
---@field layout string
---@field elementArray FlashArray
---@field frWidth number
---@field frHeight number
---@field frDisp number
watermark = {}

function watermark.MainTimeline() end

function watermark.onEventInit() end

---@param param1 number
---@return FlashObject
function watermark.getElement(param1) end

---@param param1 number
---@param param2 number
function watermark.onEventResolution(param1, param2) end

---@param param1 FlashObject
function watermark.setElementPos(param1) end

---@param param1 string
---@param param2 number
---@param param3 number
function watermark.addWatermarkText(param1, param2, param3) end

function watermark.clearWatermark() end

---@class UIRoot_waypoints: FlashObject @waypoints
---@field waypoints_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field waypoint_array FlashArray
---@field events FlashArray
---@field layout string
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
waypoints = {}

function waypoints.MainTimeline() end

function waypoints.onEventInit() end

---@param param1 number
function waypoints.setAnchor(param1) end

---@param param1 boolean
function waypoints.setController(param1) end

function waypoints.onEventResize() end

---@param param1 number
---@return boolean
function waypoints.onEventUp(param1) end

function waypoints.next() end

function waypoints.previous() end

---@param param1 string
---@param param2 string
---@return boolean
function waypoints.startsWith(param1, param2) end

---@param param1 number
---@return boolean
function waypoints.onEventDown(param1) end

function waypoints.fadeIn() end

function waypoints.fadeOut() end

function waypoints.slideIn() end

function waypoints.requestClose() end

function waypoints.requestHide() end

function waypoints.requestDestroy() end

---@param param1 number
---@param param2 string
function waypoints.setText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
function waypoints.addBtnHint(param1, param2, param3) end

function waypoints.clearBtnHints() end

function waypoints.updateWaypoints() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function waypoints.addWaypoint(param1, param2, param3) end

function waypoints.sortList() end

function waypoints.clearAll() end

---@class UIRoot_waypoints_c: FlashObject @waypoints_c
---@field btnContainer_mc FlashObject
---@field waypoints_mc FlashObject
---@field curTooltip string
---@field hasTooltip boolean
---@field timeline FlashObject
---@field anchorId string
---@field anchorPos string
---@field anchorTPos string
---@field anchorTarget string
---@field screenWidth number
---@field screenMiddle number
---@field listTweenTime number
---@field waypoint_array FlashArray
---@field events FlashArray
---@field layout string
waypoints_c = {}

function waypoints_c.MainTimeline() end

function waypoints_c.onEventInit() end

---@param param1 number
function waypoints_c.setAnchor(param1) end

---@param param1 boolean
function waypoints_c.setController(param1) end

function waypoints_c.onEventResize() end

---@param param1 number
---@return boolean
function waypoints_c.onEventUp(param1) end

function waypoints_c.next() end

function waypoints_c.previous() end

---@param param1 string
---@param param2 string
---@return boolean
function waypoints_c.startsWith(param1, param2) end

---@param param1 number
---@return boolean
function waypoints_c.onEventDown(param1) end

function waypoints_c.fadeIn() end

function waypoints_c.fadeOut() end

function waypoints_c.slideIn() end

function waypoints_c.requestClose() end

function waypoints_c.requestHide() end

function waypoints_c.requestDestroy() end

---@param param1 number
---@param param2 string
function waypoints_c.setText(param1, param2) end

---@param param1 number
---@param param2 string
---@param param3 number
function waypoints_c.addBtnHint(param1, param2, param3) end

function waypoints_c.clearBtnHints() end

function waypoints_c.updateWaypoints() end

---@param param1 number
---@param param2 string
---@param param3 boolean
function waypoints_c.addWaypoint(param1, param2, param3) end

function waypoints_c.sortList() end

function waypoints_c.clearAll() end

---@class UIRoot_worldTooltip: FlashObject @worldTooltip
---@field tooltip_mc FlashObject
---@field events FlashArray
---@field layout string
---@field tooltip_array FlashArray
---@field hasTooltip boolean
---@field isDragging boolean
---@field frameSpacing number
---@field curDataVersion boolean
---@field longTooltip_mc FlashObject
---@field worldTooltip_array FlashArray
---@field repos_array FlashArray
---@field reorder boolean
---@field retryOverlapCount number
---@field retryOverlap boolean
---@field doBoundaryCheck boolean
---@field isControllerMode boolean
worldTooltip = {}

function worldTooltip.MainTimeline() end

function worldTooltip.onEventResize() end

function worldTooltip.onEventInit() end

---@param param1 number
function worldTooltip.setAnchor(param1) end

---@param param1 boolean
function worldTooltip.updateTooltips(param1) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
function worldTooltip.setObjPos(param1, param2, param3, param4) end

---@param param1 number
---@param param2 number
---@param param3 number
---@param param4 number
---@param param5 string
---@param param6 number
---@param param7 boolean
---@param param8 number
---@param param9 number
function worldTooltip.setTooltip(param1, param2, param3, param4, param5, param6, param7, param8, param9) end

---@param param1 number
---@param param2 number
function worldTooltip.setWindow(param1, param2) end

---@param param1 boolean
function worldTooltip.setControllerMode(param1) end

function worldTooltip.removeNotUpdatedTooltips() end

---@param param1 FlashObject
function worldTooltip.showTooltipLong(param1) end

function worldTooltip.removeTooltipLong() end

---@param param1 number
function worldTooltip.removeTooltip(param1) end

function worldTooltip.clearAll() end

---@param param1 FlashObject
function worldTooltip.removedTooltipMc(param1) end

---@param param1 number
---@return FlashObject
function worldTooltip.getTooltip(param1) end

function worldTooltip.checkBoundaries() end

---@param param1 FlashObject
function worldTooltip.checkTooltipBoundaries(param1) end

---@param param1 FlashObject
function worldTooltip.setToTop(param1) end

---@return boolean
function worldTooltip.noOverlapAll() end

---@param param1 FlashObject
---@param param2 FlashObject
---@return boolean
function worldTooltip.cheaperCollisionCheck(param1, param2) end

