local hookIds = {}
local hookIds1 = {}
local resetHook = true
local resetHook1 = true
local attackTime = 0
local canClimbState = false
local teleportTime = 0
local ropeTime = 0

function SendMessage(context)
	if isDeath == true then
		return
	end
	if context then
		print(context .. "\n")
		return
	end
	print("nil\n")
end

function OutputMessage(context)
	if context then		
		local file = io.open("TrueGear.log", "a")			
		io.output(file)
		io.write(os.date("%Y-%m-%d %H:%M:%S") .. "	[TrueGear]:{".. context .."}\n")
		io.close(file)
		return
	end
end

function TeleportRegisterHooks()
	for k,v in pairs(hookIds1) do
		UnregisterHook(k, v.id1, v.id2)
	end
		
	hookIds1 = {}
		
	local funcName = "/Game/Gameplay/GameActionsSystem/Camp/BP_GameActionInstance_GoToCamp.BP_GameActionInstance_GoToCamp_C:ExecuteGameAction"
	local hook1, hook2 = RegisterHook(funcName, ExecuteGameAction)
	hookIds1[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/Characters/NPCs/Esquie/Blueprints/ABP_Esquie_Character.ABP_Esquie_Character_C:AnimNotify_OnEnterWalkingState"
	local hook1, hook2 = RegisterHook(funcName, EsquieChangeState)
	hookIds1[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/Characters/NPCs/Esquie/Blueprints/ABP_Esquie_Character.ABP_Esquie_Character_C:AnimNotify_OnEnterFlyState"
	local hook1, hook2 = RegisterHook(funcName, EsquieChangeState)
	hookIds1[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/Characters/NPCs/Esquie/Blueprints/ABP_Esquie_Character.ABP_Esquie_Character_C:AnimNotify_OnEnterBoatState"
	local hook1, hook2 = RegisterHook(funcName, EsquieChangeState)
	hookIds1[funcName] = { id1 = hook1; id2 = hook2 }

end

function RegisterHooks()


	for k,v in pairs(hookIds) do
		UnregisterHook(k, v.id1, v.id2)
	end
		
	hookIds = {}

	local funcName = "/Script/ALSV4_CPP.ALSCharacterAnimInstance:OnJumped"
	local hook1, hook2 = RegisterHook(funcName, JumpAction)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/Gameplay/Exploration/ExplorationCapacities/BP_ExplorationCapacityComponent_GrappleHook.BP_ExplorationCapacityComponent_GrappleHook_C:SpawnRope"
	local hook1, hook2 = RegisterHook(funcName, SpawnRope)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/Gameplay/Exploration/ExplorationCapacities/BP_ExplorationCapacityComponent_GrappleHook.BP_ExplorationCapacityComponent_GrappleHook_C:MoveRope"
	local hook1, hook2 = RegisterHook(funcName, MoveRope)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_Battle_Base.BP_jRPG_Character_Battle_Base_C:OnParrySuccess"
	local hook1, hook2 = RegisterHook(funcName, OnParrySuccess)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_Battle_Base.BP_jRPG_Character_Battle_Base_C:OnDodgeSuccess"
	local hook1, hook2 = RegisterHook(funcName, OnDodgeSuccess)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_Battle_Base.BP_jRPG_Character_Battle_Base_C:OnDamageReceived"
	local hook1, hook2 = RegisterHook(funcName, OnDamageReceived)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_Battle_Base.BP_jRPG_Character_Battle_Base_C:OnDeath"
	local hook1, hook2 = RegisterHook(funcName, OnDeath)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/Gameplay/Exploration/ExplorationCapacities/Rope/BP_ExplorationCapacityComponent_Rope.BP_ExplorationCapacityComponent_Rope_C:UpdateMovingAlongRope"
	local hook1, hook2 = RegisterHook(funcName, UpdateMovingAlongRope)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
		
	local funcName = "/Game/UI/Widgets/InGame_Menu/Sub_Widget/WBP_HealingElixirCount.WBP_HealingElixirCount_C:TriggerHeal"
	local hook1, hook2 = RegisterHook(funcName, TriggerHeal)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/Gameplay/FreeAim/BP_FreeAim.BP_FreeAim_C:PerformShoot"
	local hook1, hook2 = RegisterHook(funcName, Shoot)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_Battle_Base.BP_jRPG_Character_Battle_Base_C:ShootFreeAimProjectile"
	local hook1, hook2 = RegisterHook(funcName, Shoot)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/Gameplay/Climbing/BP_ClimbingComponent.BP_ClimbingComponent_C:ChangeState"
	local hook1, hook2 = RegisterHook(funcName, ChangeState)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/Gameplay/Climbing/BP_ClimbingComponent.BP_ClimbingComponent_C:OnClimbingJumpMovementStart"
	local hook1, hook2 = RegisterHook(funcName, OnClimbingJumpMovementStart)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
				
	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_World.BP_jRPG_Character_World_C:CharacterSwitch"
	local hook1, hook2 = RegisterHook(funcName, CharacterSwitch)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_World.BP_jRPG_Character_World_C:K2_OnEndCrouch"
	local hook1, hook2 = RegisterHook(funcName, K2_OnEndCrouch)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_World.BP_jRPG_Character_World_C:K2_OnStartCrouch"
	local hook1, hook2 = RegisterHook(funcName, K2_OnStartCrouch)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
		
	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_World.BP_jRPG_Character_World_C:GenerateExplorationAttack"
	local hook1, hook2 = RegisterHook(funcName, GenerateExplorationAttack)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
	
	local funcName = "/Game/jRPGTemplate/Blueprints/Components/AC_jRPG_InventoryManager.AC_jRPG_InventoryManager_C:AddItemToInventory"
	local hook1, hook2 = RegisterHook(funcName, AddItemToInventory)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
		
	local funcName = "/Game/UI/Widgets/HUD_Battle/Buttons/WBP_HUD_QTE.WBP_HUD_QTE_C:Perfect QTE"
	local hook1, hook2 = RegisterHook(funcName, Perfect)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/UI/Widgets/HUD_Battle/Buttons/WBP_HUD_QTE.WBP_HUD_QTE_C:Regular QTE"
	local hook1, hook2 = RegisterHook(funcName, Regular)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/UI/Widgets/HUD_Battle/Buttons/WBP_HUD_QTE.WBP_HUD_QTE_C:Miss QTE"
	local hook1, hook2 = RegisterHook(funcName, Miss)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/LevelTools/BP_jRPG_MapTeleportPoint.BP_jRPG_MapTeleportPoint_C:ReceiveBeginPlay"
	local hook1, hook2 = RegisterHook(funcName, TeleportReceiveBeginPlay)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_World.BP_jRPG_Character_World_C:OnBattleStarts"
	local hook1, hook2 = RegisterHook(funcName, OnBattleStarts)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }

	local funcName = "/Game/jRPGTemplate/Blueprints/Basics/BP_jRPG_Character_Battle_Base.BP_jRPG_Character_Battle_Base_C:StartJumpFeedback"
	local hook1, hook2 = RegisterHook(funcName, StartJumpFeedback)
	hookIds[funcName] = { id1 = hook1; id2 = hook2 }
end

-- *******************************************************************

function EsquieChangeState(self)
	SendMessage("--------------------------------")
	SendMessage("EsquieChangeState")
	OutputMessage("EsquieChangeState")
	SendMessage(self:get():GetFullName())
end

function ExecuteGameAction(self)
	SendMessage("--------------------------------")
	SendMessage("GotoCamp")
	OutputMessage("Teleport")
	SendMessage(self:get():GetFullName())
end

function StartJumpFeedback(self)
	SendMessage("--------------------------------")
	SendMessage("StartJumpFeedback")
	OutputMessage("Jump")
	SendMessage(self:get():GetFullName())
end

function OnBattleStarts(self)
	SendMessage("--------------------------------")
	SendMessage("OnBattleStarts")
	OutputMessage("Teleport")
	SendMessage(self:get():GetFullName())
end

function TeleportReceiveBeginPlay(self)
	if os.clock() - teleportTime < 0.5 then
		return
	end
	teleportTime = os.clock()
	SendMessage("--------------------------------")
	SendMessage("TeleportReceiveBeginPlay")
	OutputMessage("Teleport")
	SendMessage(self:get():GetFullName())
	if resetHook1 then
		local ran, errorMsg = pcall(TeleportRegisterHooks)
		if ran then
			resetHook1 = false
		else
			print(errorMsg)
		end
	end	
end

function Miss(self)
	SendMessage("--------------------------------")
	SendMessage("QTEMiss")
	OutputMessage("QTEMiss")
	SendMessage(self:get():GetFullName())
end

function Regular(self)
	SendMessage("--------------------------------")
	SendMessage("QTERegular")
	OutputMessage("QTERegular")
	SendMessage(self:get():GetFullName())
end

function Perfect(self)
	SendMessage("--------------------------------")
	SendMessage("QTEPerfect")
	OutputMessage("QTEPerfect")
	SendMessage(self:get():GetFullName())
end


function AddItemToInventory(self)
	SendMessage("--------------------------------")
	SendMessage("AddItemToInventory")
	OutputMessage("AddItemToInventory")
	SendMessage(self:get():GetFullName())
end

function K2_OnEndCrouch(self)
	SendMessage("--------------------------------")
	SendMessage("K2_OnEndCrouch")
	OutputMessage("Crouch")
	SendMessage(self:get():GetFullName())
end

function K2_OnStartCrouch(self)
	SendMessage("--------------------------------")
	SendMessage("K2_OnStartCrouch")
	OutputMessage("Crouch")
	SendMessage(self:get():GetFullName())
end


function GenerateExplorationAttack(self,A)
	if A:get() > 0 then
		if os.clock() - attackTime < 0.5 then
			return
		end
		attackTime = os.clock()
		SendMessage("--------------------------------")
		SendMessage("GenerateExplorationAttack")
		OutputMessage("PlayerAttack")
		SendMessage(self:get():GetFullName())
		SendMessage(tostring(A:get()))
	end
	
end

function CharacterSwitch(self)
	SendMessage("--------------------------------")
	SendMessage("CharacterSwitch")
	OutputMessage("CharacterSwitch")
	SendMessage(self:get():GetFullName())
end



function OnClimbingJumpMovementStart(self)
	canClimbState = false
	SendMessage("--------------------------------")
	SendMessage("ClimbJump")
	OutputMessage("ClimbJump")
	SendMessage(self:get():GetFullName())
end

function ChangeState(self,NewState)
	if NewState:get() == 1 then
		canClimbState = true
	elseif canClimbState and NewState:get() == 2 then
		SendMessage("--------------------------------")
		SendMessage("Climb")
		OutputMessage("Climb")
		SendMessage(self:get():GetFullName())
	end
end



function Shoot(self)
	SendMessage("--------------------------------")
	SendMessage("Shoot")
	OutputMessage("Shoot")
	SendMessage(self:get():GetFullName())
	SendMessage(tostring(os.clock()))
end


function TriggerHeal(self)
	SendMessage("--------------------------------")
	SendMessage("TriggerHeal")
	OutputMessage("Healing")
	SendMessage(self:get():GetFullName())
end

function OnDeath(self)
	if string.find(self:get():GetFullName(),"Enemy") then
		return
	end
	SendMessage("--------------------------------")
	SendMessage("OnDeath")
	OutputMessage("PlayerDeath")
	SendMessage(self:get():GetFullName())
end

function UpdateMovingAlongRope(self)
	SendMessage("--------------------------------")
	SendMessage("UpdateMovingAlongRope")
	OutputMessage("MovingAlongRope")
	SendMessage(self:get():GetFullName())
end

function OnDamageReceived(self,Damage,Critical,Weakness,Resistant,Element,Reason,DamageCharacterSource)
	SendMessage("--------------------------------")
	SendMessage("OnDamageReceived")
	if string.find(self:get():GetFullName(),"Enemy") and (Reason:get() == 1 or Reason:get() == 4 or Reason:get() == 5) then
		SendMessage("Hit")
		OutputMessage("PlayerHit")
	elseif(not string.find(self:get():GetFullName(),"Enemy")) then
		SendMessage("Damage")
		OutputMessage("PlayerDamage")
	end
	
end

function OnParrySuccess(self)
	SendMessage("--------------------------------")
	SendMessage("OnParrySuccess")
	OutputMessage("PlayerParry")
	SendMessage(self:get():GetFullName())
end

function OnDodgeSuccess(self)
	SendMessage("--------------------------------")
	SendMessage("OnDodgeSuccess")
	OutputMessage("PlayerDodge")
	SendMessage(self:get():GetFullName())
end

function MoveRope(self)
	if os.clock() - ropeTime < 0.1 then 
		return
	end
	ropeTime = os.clock()
	SendMessage("--------------------------------")
	SendMessage("MoveRope")
	OutputMessage("MovingRope")
	SendMessage(self:get():GetFullName())
end

function SpawnRope(self)
	SendMessage("--------------------------------")
	SendMessage("SpawnRope")
	OutputMessage("SpawnRope")
	SendMessage(self:get():GetFullName())
end

function JumpAction(self)
	SendMessage("--------------------------------")
	SendMessage("JumpAction")
	OutputMessage("Jump")
	SendMessage(self:get():GetFullName())
end


function CheckPlayerSpawned()
	RegisterHook("/Script/Engine.PlayerController:ClientRestart", function()
		if resetHook then
			local ran, errorMsg = pcall(RegisterHooks)
			if ran then
				local file = io.open("TrueGear.log", "w")
				if file then
					file:close()
				else
					print("无法打开文件")
				end
				resetHook = false
			else
				print(errorMsg)
			end
		end		
	end)
end

SendMessage("TrueGear Mod is Loaded");
CheckPlayerSpawned()
