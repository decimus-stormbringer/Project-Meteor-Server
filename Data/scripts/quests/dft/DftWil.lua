require ("global")

--[[

Quest Script

Name:   Small Talk
Code:   DftWil
Id:     110543

Contains all default lines for talkable npcs in the Wilderness Region (aka Thanalan).
* NOTE: This quest is active for all players at all times.
]]

-- [ActorClassId] = "client_function_name"
local defaultTalkWil = {
    [1000046] = "defaultTalkWithGogofu_001",            -- Gogofu
    [1000047] = "defaultTalkWithHahayo_001",            -- Hahayo
    [1000070] = "defaultTalkWithKukumuko_001",          -- Kukumuko
    [1000293] = "defaultTalkWithDeaustie_001",          -- Deaustie     - defaultTalkWithDeaustie_002 (her dialog after unlocking WVR?)
    [1000374] = "defaultTalkWithRorojaru_001",          -- Rorojaru
    [1000597] = "defaultTalkWithNogeloix_001",          -- Nogeloix
    [1000635] = "defaultTalkWithHnaufrid_001",          -- Hnaufrid     - Will not fire since he isn't PplStd
    [1000638] = "defaultTalkWithHawazizowazi_001",      -- Hawazi Zowazi
    [1000639] = "defaultTalkWithIsabella_001",          -- Isabella
    [1000640] = "defaultTalkWithCiceroix_001",          -- Ciceroix
    [1000641] = "defaultTalkWithXaunbolo_001",          -- Xau Nbolo
    [1000642] = "defaultTalkWithOefyrblaet_001",        -- Oefyrblaet
    [1000643] = "defaultTalkWithBabaki_001",            -- Babaki
    [1000644] = "defaultTalkWithLohwaeb_001",           -- Lohwaeb
    [1000645] = "defaultTalkWithMargarete_001",         -- Margarete
    [1000646] = "defaultTalkWithRinhmaimhov_001",       -- Rinh Maimhov
    [1000647] = "defaultTalkWithLyngwaek_001",          -- Lyngwaek
    [1000648] = "defaultTalkWithWawaton_001",           -- Wawaton
    [1000649] = "defaultTalkWithDyalwann_001",          -- <<<NOT IMPLEMENTED>>> - D'yalwann - Empty function.  No wiki info, likely unused.  Has book prop.
    [1000650] = "defaultTalkWithSedemode_001",          -- <<<NOT IMPLEMENTED>>> - Sedemode  - Empty function.  No wiki info, likely unused.
    [1000651] = "defaultTalkWithPopori_001",            -- Popori
    [1000652] = "defaultTalkWithMamaza_001",            -- Mamaza
    [1000653] = "defaultTalkWithNhagiamariyo_001",      -- Nhagi Amariyo
    [1000654] = "defaultTalkWithJajanzo_001",           -- Jajanzo
    [1000655] = "defaultTalkWithJeger_001",             -- Jeger
    [1000656] = "defaultTalkWithMartine_001",           -- Martine
    [1000658] = "defaultTalkWithGairbert_001",          -- Gairbert
    [1000659] = "defaultTalkWithDrew_001",              -- Drew 
    [1000665] = "defaultTalkWithRosalind_001",          -- Rosalind
    [1000666] = "defaultTalkWithOcoco_001",             -- Ococo
    [1000668] = "defaultTalkWithUbokhn_001",            -- U'bokhn
    [1000672] = "defaultTalkWithBlandhem_001",          -- Blandhem
	[1600062] = "defaultTalkWithBenedict_001",			-- Benedict
	[1500073] = "defaultTalkWithLudovraint_001",		-- Ludovraint
	[1500099] = "defaultTalkWithMimina_001",			-- Mimina
    [1000673] = "defaultTalkWithChechedoba_001",        -- Chechedoba
    [1000674] = "defaultTalkWithZllayan_001",           -- Z'llayan 	-(Eastern Thanalan: Camp Drybone)
    [1000780] = "defaultTalkWithKiora_001",             -- Kiora        - defaultTalkWithKiora_002 / 003 (informs about MRD guild)
    [1000781] = "defaultTalkWithOpondhao_001",          -- O'pondhao    - defaultTalkWithOpondhao_002 / 003 (informs about FSH guild)
    [1000782] = "defaultTalkWithBertram_001",           -- Bertram      - defaultTalkWithBertram_002 / 003 (informs about CUL guild)
    [1000783] = "defaultTalkWithMinerva_001",           -- Minvera      - defaultTalkWithMinerva_002 / 003 / 004 (informs about BSM guild. Extra dialog also if you're on a DoW/M?)
    [1000784] = "defaultTalkWithZoengterbin_001",       -- Zoengterbin  - defaultTalkWithZoengterbin_002 / 003 (informs about LNC guild)
    [1000785] = "defaultTalkWithStyrmoeya_001",         -- Styrmoeya    - defaultTalkWithStyrmoeya_002 / 003 (informs about ARC guild)
    [1000786] = "defaultTalkWithYhahamariyo_001",       -- Yhah Amariyo - defaultTalkWithYhahamariyo_002 / 003 (informs about CNJ guild)
    [1000787] = "defaultTalkWithHildie_001",            -- Hildie       - defaultTalkWithHildie_002 / 003 (informs about CRP guild)
    [1000788] = "defaultTalkWithLettice_001",           -- Lettice      - defaultTalkWithLettice_002 / 003 (informs about LTW guild)
    [1000789] = "defaultTalkWithTyon_001",              -- Tyon         - defaultTalkWithTyon_002 / 003 (informs about BTN guild)
    [1000840] = "defaultTalkWithRururaji_001",          -- Rururaji     - Presumably dialog pre-Chocobo update. Will not fire due to actor class change since then.
    [1000841] = "defaultTalkWithMomodi_001",            -- Momodi
    [1000846] = "defaultTalkWithYayake_001",            -- Yayake       - defaultTalkWithYayake_002 (her dialog after unlocking THM?)
    [1000847] = "defaultTalkWithIllofii_001",           -- I'llofii
    [1000861] = "defaultTalkWithLinette_001",           -- Linette
    [1000862] = "defaultTalkWithGagaruna_001",          -- Gagaruna
    [1000863] = "defaultTalkWithLulutsu_001",           -- Lulutsu
    [1000864] = "defaultTalkWithOtopapottopa_001",      -- Otopa Pottopa -  defaultTalkWithInn_Desk - used when Inn unlocked
    [1000865] = "defaultTalkWithThaisie_001",           -- Thaisie      - Mentions retainers, but will not fire since she's not PplStd.
    [1000887] = "defaultTalkWithZssapa_001",            -- Z'ssapa  (Central Thanalan: Black Brush, Nanawa Mines) alt actor ID: 1001217 - has different outfit from wiki (Mining quest: 110460 - Min200)
    [1000915] = "defaultTalkWithCahernaut_001",         -- Cahernaut
    [1000916] = "defaultTalkWithAspipi_001",            -- Aspipi
    [1000917] = "defaultTalkWithGloiucen_001",          -- Gloiucen
    [1000934] = "defaultTalkWithTitinin_001",           -- Titinin
    [1000950] = "defaultTalkWithElecotte_001",          -- Elecotte
    [1000955] = "defaultTalkWithNaidazamaida_001",      -- Naida Zamaida
    [1000962] = "defaultTalkWithPapawa_001",            -- Papawa
    [1000963] = "defaultTalkWithGaleren_001",           -- Galeren
    [1000964] = "defaultTalkWithFhruybolg_001",         -- Fruhybolg
    [1000965] = "defaultTalkWithAbylgohamylgo_001",     -- Abylgo Hamylgo
    [1000966] = "defaultTalkWithFinecoromanecco_001",   -- Fineco Romanecco
    [1000967] = "defaultTalkWithSwerdahrm_001",         -- Swerdahrm
    [1000968] = "defaultTalkWithWannore_001",           -- Wannore
    [1000969] = "defaultTalkWithQmhalawi_001",          -- Q'mhalawai
    [1000994] = "defaultTalkWithLefchild_001",          -- Lefchild
    [1001007] = "defaultTalkWithHalstein_001",          -- Halstein
    [1001009] = "defaultTalkWithMelisie_001",           -- Melisie
    [1001012] = "defaultTalkWithShamanilohmani_001",    -- Shamani Lohmani
    [1001022] = "defaultTalkWithSungikelungi_001",      -- Sungi Kelungi
    [1001055] = "defaultTalkWithBouchard_001",          -- Bouchard
    [1001056] = "defaultTalkWithHolbubu_001",           -- Holbubu
    [1001073] = "defaultTalkWithObilitambili_001",      -- Obili Tambili
    [1001074] = "defaultTalkWithMiyaya_001",            -- Miyaya
    [1001075] = "defaultTalkWithBerthar_001",           -- Berthar
    [1001141] = "defaultTalkWithTutubuki_001",          -- Tutubuki
    [1001142] = "defaultTalkWithKamlitohalito_001",     -- Kamlito Halito
    [1001143] = "defaultTalkWithTotono_001",            -- Totono
    [1001144] = "defaultTalkWithFyrilsunn_001",         -- Fyrilsunn
    [1001145] = "defaultTalkWithSinette_001",           -- Sinette
    [1001146] = "defaultTalkWithZirnbyrt_001",          -- Zirnbyrt - Entry Denier (Eastern Thanalan) Guards unused dun01)
    [1001147] = "defaultTalkWithVhasotayuun_001",       -- Vhaso Tayuun - Entry Denier (Eastern Thanalan: Guards unused dun03)
    [1001148] = "defaultTalkWithPulbeiyalbei_001",      -- <<<NOT IMPLEMENTED>>> - Pulbei Yalbei - (Entry Denier?  No wiki info)
    [1001149] = "defaultTalkWithGembert_001",           -- Gembert - Entry Denier Guard (Southern Thanalan: Guards unused dun06)
    [1001165] = "defaultTalkWithMumukiya_001",          -- Mumukiya
    [1001166] = "defaultTalkWithYuyubesu_001",          -- Yuyubesu
    [1001167] = "defaultTalkWithChachai_001",           -- Chachai
    [1001168] = "defaultTalkWithFifilo_001",            -- Fifilo
    [1001169] = "defaultTalkWithPierriquet_001",        -- Pierriquet
    [1001170] = "defaultTalkWithMohtfryd_001",          -- Mothfryd
    [1001171] = "defaultTalkWithQhotanbolo_001",        -- Qhota Nbolo
    [1001191] = "defaultTalkWithGuildleveClientU_001",  -- Roarich
    [1001192] = "defaultTalkWithGuildleveClientU_002",  -- Claroise
    [1001193] = "defaultTalkWithGuildleveClientU_003",  -- Uwilsyng
    [1001200] = "defaultTalkWithJannie_001",            -- Jannie
    [1001201] = "defaultTalkWithDylise_001",            -- Dylise
    [1001202] = "defaultTalkWithBarnabaix_001",         -- Barnabaix
    [1001203] = "defaultTalkWithTyagomoui_001",         -- Tyago Moui
    [1001256] = "defaultTalkWithMaginfred_001",         -- Gunnulf
    [1001257] = "defaultTalkWithOrisic_001",            -- Heibert
    [1001260] = "defaultTalkWithKlamahni_001",          -- I'paghlo
    [1001295] = "defaultTalkWithChamberlain_001",       -- <<<NOT IMPLEMENTED>>> - Chamberlain (Entry Denier?  No wiki info)
    [1001296] = "defaultTalkWithWyntkelt_001",          -- <<<NOT IMPLEMENTED>>> - Wyntkelt (Entry Denier?  No wiki info)
    [1001297] = "defaultTalkWithAudrye_001",            -- <<<NOT IMPLEMENTED>>> - Audrye (Entry Denier?  No wiki info)
    [1001314] = "defaultTalkWithFromelaut_001",         -- Fromelaut (Eastern Thanalan: The Golden Bazaar)
    [1001315] = "defaultTalkWithZilili_001",            -- Zilili (Eastern Thanalan: The Golden Bazaar) - Dialog doesn't match wiki, but wiki dialog isn't addressed by any function.  Changed in an update perhaps.
    [1001316] = "defaultTalkWithPapala_001",            -- Papala (Eastern Thanalan: The Golden Bazaar)
    [1001317] = "defaultTalkWithSasapano_001",          -- Sasapano (Eastern Thanalan: The Golden Bazaar) (Part of quest, Best Flower Ever, 110684, Etc1u9)
    [1001318] = "defaultTalkWithBibiroku_001",          -- Bibiroku (Eastern Thanalan: The Golden Bazaar)
    [1001319] = "defaultTalkWithBernier_001",           -- Bernier (Eastern Thanalan: The Golden Bazaar)
    [1001320] = "defaultTalkWithJajaba_001",            -- Jajaba (Eastern Thanalan: The Golden Bazaar)
    [1001321] = "defaultTalkWithJujuya_001",            -- Jujuya (Eastern Thanalan: The Golden Bazaar)
    [1001322] = "defaultTalkWithKikinori_001",          -- Kikinori (Western Thanalan: The Silver Bazaar)
    [1001323] = "defaultTalkWithCelie_001",             -- Celie (Western Thanalan: The Silver Bazaar)
    [1001324] = "defaultTalkWithAgzurungzu_001",        -- Agzu Rungzu (Western Thanalan: The Silver Bazaar)
    [1001325] = "defaultTalkWithDarimbeh_001",          -- D'arimbeh (Western Thanalan: The Silver Bazaar)
    [1001326] = "defaultTalkWithIudprost_001",          -- Iudprost (Western Thanalan: The Silver Bazaar)
    [1001327] = "defaultTalkWithTatafu_001",            -- Tatafu (Western Thanalan: The Silver Bazaar)
    [1001328] = "defaultTalkWithAthalwolf_001",         -- Athalwolf (Western Thanalan: The Silver Bazaar)
    [1001329] = "defaultTalkWithPadakusondaku_001",     -- Padaku Sondaku (Western Thanalan: The Silver Bazaar)
    [1001330] = "defaultTalkWithBellinda_001",          -- Bellinda (Eastern Thanalan, Little Ala Mhigo)
    [1001331] = "defaultTalkWithRonthfohc_001",         -- Ronthfohc (Eastern Thanalan, Little Ala Mhigo)
    [1001332] = "defaultTalkWithBerahthraben_001",      -- Berahthraben (Eastern Thanalan, Little Ala Mhigo)
    [1001333] = "defaultTalkWithOtho_001",              -- Otho (Eastern Thanalan, Little Ala Mhigo)
    [1001334] = "defaultTalkWithRadulf_001",            -- Radulf (Eastern Thanalan, Little Ala Mhigo)
    [1001335] = "defaultTalkWithHonmeme_001",           -- Honmeme (Eastern Thanalan, Little Ala Mhigo)
    [1001336] = "defaultTalkWithCatriona_001",          -- Catriona (Eastern Thanalan, Little Ala Mhigo)
    [1001337] = "defaultTalkWithGrifiud_001",           -- Grifiud (Eastern Thanalan, Little Ala Mhigo)
    [1001392] = "defaultTalkWithNomomo_001",            -- Nomomo - If arg1=true, says different dialog.
    [1001415] = "defaultTalkWithAnthoinette_001",       -- Anthoinette
    [1001416] = "defaultTalkWithWisemoon_001",          -- Wise Moon
    [1001417] = "defaultTalkWithApachonaccho_001",      -- Apacho Naccho
    [1001418] = "defaultTalkWithWyznguld_001",          -- Wyznguld
    [1001419] = "defaultTalkWithNeymumu_001",           -- Neymumu
    [1001420] = "defaultTalkWithSafufu_001",            -- Safufu
    [1001421] = "defaultTalkWithPenelizuneli_001",      -- Peneli Zuneli
    [1001422] = "defaultTalkWithMilgogo_001",           -- Milgogo
    [1001423] = "defaultTalkWithMumutano_001",          -- Mumutano
    [1001424] = "defaultTalkWithGegeissa_001",          -- Gegeissa
    [1001425] = "defaultTalkWithGdatnan_001",           -- G'datnan 
    [1001426] = "defaultTalkWithHehena_001",            -- Hehena
    [1001427] = "defaultTalkWithGuillaunaux_001",       -- Guillaunaux
    [1001428] = "defaultTalkWithYuyuhase_001",          -- Yuyuhase
    [1001429] = "defaultTalkWithLulumo_001",            -- Lulumo
    [1001438] = "defaultTalkWithNokksushanksu_001",     -- Nokksu Shanksu
    [1001439] = "defaultTalkWithThimm_001",             -- Thimm
    [1001440] = "defaultTalkWithQaruru_001",            -- Qaruru
    [1001441] = "defaultTalkWithWracwulf_001",          -- Wracwulf
    [1001442] = "defaultTalkWithWenefreda_001",         -- Wenefreda
    [1001443] = "defaultTalkWithJudithe_001",           -- Judithe
    [1001444] = "defaultTalkWithRobyn_001",             -- Robyn
    [1001445] = "defaultTalkWithSingleton_001",         -- Singleton
    [1001446] = "defaultTalkWithFiachre_001",           -- Fiachre (Western Thanalan Ferry Docks)
    [1001447] = "defaultTalkWithTaylor_001",            -- Taylor (Western Thanalan Ferry Docks)
    [1001448] = "defaultTalkWithWalhbert_001",          -- Walhbert (Western Thanalan Ferry Docks)
    [1001449] = "defaultTalkWithSpiralingpath_001",     -- Spiraling Path (Western Thanalan Ferry Docks)
    [1001450] = "defaultTalkWithSasapiku_001",          -- Sasapiku (Western Thanalan Ferry Docks)
    [1001451] = "defaultTalkWithDoll001_001",           -- Mammet (Eshtaime's Lapidaries [GSM])
    [1001452] = "defaultTalkWithDoll002_001",           -- Mammet (Eshtaime's Lapidaries [GSM] #2)
    [1001453] = "defaultTalkWithDoll003_001",           -- Mammet (Sunsilk Tapestries [WVR])
    [1001454] = "defaultTalkWithDoll004_001",           -- Mammet (Frondale's Phrontistery [ALC])
    [1001455] = "defaultTalkWithDoll005_001",           -- Mammet (Merchant Strip)
    [1001462] = "defaultTalkWithQatanelhah_001",        -- Qata Nelhah
    [1001463] = "defaultTalkWithKukusi_001",            -- Kukusi
    [1001464] = "defaultTalkWithVannes_001",            -- Vannes
    [1001465] = "defaultTalkWithTatasha_001",           -- Tatasha
    [1001466] = "defaultTalkWithXdhilogo_001",          -- X'dhilogo
    -- [1001467] = "",                                  -- Dariustel    - No dialog. Supposed to be flagged as untargetable
    -- [1001468] = "",                                  -- Guencen      - No dialog. Supposed to be flagged as untargetable
    [1001475] = "defaultTalkWithDiriaine_001",          -- Diriaine
    [1001476] = "defaultTalkWithCrhabye_001",           -- C'rhabye
    [1001471] = "downTownTalk",                         -- Kokobi
    [1001472] = "defaultTalkWithMimishu_001",           -- Mimishu
    [1001503] = "defaultTalkWithGerland_001",           -- Gerland (Western Thanalan Ferry Docks)
    [1001565] = "defaultTalkWithEleanor_001",           -- Eleanor
    [1001596] = "defaultTalkWithAbelard_001",           -- Abelard (Western Thanalan: The Coffer & Coffin)
    [1001597] = "defaultTalkWithHaipoeipo_001",         -- Haipo Eipo (Western Thanalan: The Coffer & Coffin)
    [1001598] = "defaultTalkWithBartholomew_001",       -- Bartholomew (Western Thanalan: The Coffer & Coffin)
    [1001599] = "defaultTalkWithKokofubu_001",          -- Kokofubu (Eastern Thanalan: Mythril Pit T-8)
    [1001600] = "defaultTalkWithBertouaint_001",        -- Bertouaint (Eastern Thanalan: Mythril Pit T-8)
    [1001601] = "defaultTalkWithAldebrand_001",         -- Aldebrand (Eastern Thanalan: Mythril Pit T-8)
    [1001602] = "defaultTalkWithPyhajawantal_001",      -- Pyha Jawantal (Eastern Thanalan: Mythril Pit T-8)
    --[1001624] = "talkIdayCap",                        -- <<<NOT IMPLEMENTED>>> - Flame Lieutenant Somber Meadow   (Foundation Day 2011 Dialog) - OLD EVENT NPC: Replaced by 2012 version
    --[1001625] = "talkIday1",                          -- <<<NOT IMPLEMENTED>>> - Flame Sergeant Mimio Mio         (Foundation Day 2011 Dialog) - OLD EVENT NPC: Replaced by 2012 version
    --[1001626] = "talkIday2",                          -- <<<NOT IMPLEMENTED>>> - Flame Private Sisimuza Tetemuza  (Foundation Day 2011 Dialog) - OLD EVENT NPC: Replaced by 2012 version
    [1001630] = "defaultTalkWithChocobo_001",           -- Chocobo (Western Thanalan: The Coffer & Coffin) - Stands beside Haipo Eipo
    [1001685] = "defaultTalkWithAdalbert_001",          -- Flame Sergeant Cotter (Ul'dah: Pearl Lane)
    [1001699] = "defaultTalkWithJandonaut_001",         -- Flame Sergeant Fouillel (Southern Thanalan: Camp Broken Water)
    [1001712] = "defaultTalkWithGuillestet_001",        -- Guillestet
    [1001713] = "defaultTalkWithHCidjaa_001",           -- H'cidjaa
    [1001714] = "defaultTalkWithAutgar_001",            -- Autgar (Ul'dah: Airship Landing)
    [1001715] = "defaultTalkWithAhldbyrt_001",          -- Ahldbyrt (Ul'dah: Airship Landing)
    [1001716] = "defaultTalkWithNeymiFunomi_001",       -- Neymi Funomi (Ul'dah: Airship Landing)
    [1001717] = "defaultTalkWithGoodife_001",           -- Goodife
    [1001726] = "defaultTalkWithAistan_001",            -- Aistan
    [1001727] = "defaultTalkWithMateria_001",           -- Mutamix Bubblypots (Central Thanalan: East of Nanawa Mines)
    [1001728] = "defaultTalkWithSWYNBROES_001",         -- Swynbroes (Central Thanalan: East of Nanawa Mines)
    [1001729] = "defaultTalkWithKokosamu_001",          -- Kokosamu (Central Thanalan: East of Nanawa Mines)
    [1001730] = "defaultTalkWithF_HOBHAS_001",          -- F'hobhas (Central Thanalan: East of Nanawa Mines)
    [1001753] = "defaultTalkWithPelhiEpocan_001",       -- Pelhi Epocan (Ul'dah: Airship Landing)
    [1001754] = "defaultTalkWithViolenne_001",          -- Violenne (Ul'dah: Airship Landing)
    [1001770] = "defaultTalkWithEara_001",              -- Eara
    [1001771] = "defaultTalkWithLiaime_001",            -- Liaime
    [1001834] = "defaultTalkWithLUDOLD_001",            -- Flame Commander Ashdale - (Eastern Thanalan: Northwest of Amaljaa Alter according to wiki)
    [1001840] = "defaultTalkWithPAHJAZHWAN_001",        -- Pahja Zhwan - (Ul'dah: Miner's Guild) - Bookmarked two photos confirming location
    [1001894] = "defaultTalkWithDonner_001",            -- Flame Private Greave - (North Thanalan: Cutters Cry Entrance)
    [1001911] = "defaultTalkWithLolomaya_001",          -- Lolomaya - (North Thanalan: Camp Bluefog)
    [1001925] = "defaultTalkWithHortwann_001",          -- Flame Private Hanskalsyn - (North Thanalan: Cutters Cry Entrance)
    [1001932] = "defaultTalkWithSIBOLD_001",            -- Sibold
    [1001953] = "defaultTalkWithBerndan_001",           -- Berndan
    [1002047] = "defaultTalkWithKopuruFupuru_001",      -- Kopuru Fupuru - Inn NPC -  defaultTalkWithInn_Desk_2 used when Inn unlocked
    [1002101] = "defaultTalkWithDuraltharal_001",       -- Dural Tharal
    [1002110] = "processEventSOMBER",                   -- Flame Lieutenant Somber Meadow   (Foundation Day 2012 Dialog) Spl000 staticactor
    [1002111] = "processEventMIMIO",                    -- Flame Sergeant Mimio Mio         (Foundation Day 2012 Dialog) Spl000 staticactor
    [1002112] = "processEventSISIMUZA",                 -- Flame Private Sisimuza Tetemuza  (Foundation Day 2012 Dialog) Spl000 staticactor
	--[1001956] - Flame Private Stark					-- Flame Private Stark (Northern Thanalan - Cutters Cry Entrance) does not fire, not Pplstd
    [1002116] = "defaultTalkWithHAVAK_ALVAK_001",       -- <<<NOT IMPLEMENTED>>> - Havak Alvak (Ul'dah: Milvaneth Sacrarium)
    [1060028] = "defaultTalkWithCURIOUS_001",           -- Curious Gorge (Western Thanalan: Southeast of Scorpion Keep in Cave) - defaultTalkWithCURIOUS_002
    [1060029] = "defaultTalkWithSarra_001",             -- Sarra (Western Thanalan: Silver Bazaar) defaultTalkWithSarra_002 / 003
    [1060032] = "defaultTalkWithWidargeli_001",         -- Widargelt (Eastern Thanalan: Little Ala Mhigo) - defaultTalkWithWidargeli_002 (Part of Monk questline) (Needs verification whether he spawns here, video shows in Little Ala Mhigo for Monk quest, and another not spawned in Public Area)
    [1060033] = "defaultTalkWithErik_001",              -- Erik  (Ul'dah: Sapphire Avenue Exchange) - defaultTalkWithErik_002 (Part of Monk questline) (Sidequest, Class is in Session, 110863, Noc003)
    [1060035] = "defaultTalkWithLalai_001",             -- Lalai (Ul'dah: Milvaneth Sacrarium) - defaultTalkWithLalai_002 / 003 / 004 / 005 / 006 / 007 / 101 (Blm questline, A Time to Kill, 111262, Blm0j2)
    [1060036] = "defaultTalkWithKazagg_001",            -- Kazagg Chah (Western Thalanan)  defaultTalkWithKazagg_002 / 003 / 004 / 005 / 006 / 007 - (quest, 111266, blm0j6, Always Bet on Black)
    [1060037] = "defaultTalkWithHateli_001",            -- Dozol Meloc (Western Thanalan)  defaultTalkWithHateli_002 / 003 / 004 / 005 / 006 / 007 - (quest, 111266, blm0j6, Always Bet on Black) 
    [1060038] = "defaultTalkWithDaza_001",              -- 269th Order Mendicant Da Za (Western Thanalan) -  defaultTalkWithDaza_002 / 003 / 004 / 005 / 006 / 007
    [1060042] = "defaultTalkWithJenlyns_001",           -- Jenlyns      - defaultTalkWithJenlyns_002 (PLD-unlocked specific dialog?)
    [1200120] = "bookTalk",                             -- Dusty Tomes  - Will not fire since it isn't PplStd.  Identical dialog regardless.
    [1500059] = "defaultTalkWithLdhakya_001",           -- L'dhakya (Western Thanalan Ferry Docks)
    [1500109] = "defaultTalkWithSylviel_001",           -- Sylviel (Western Thanalan Ferry Docks)
    [1500110] = "defaultTalkWithSamigamduhla_001",      -- Sami Gamduhla (Western Thanalan Ferry Docks)
    [1500126] = "tribeTalk",                            -- Vavaki
    [1500129] = "defaultTalkWithYayatoki_001",          -- Yayatoki
    [1500230] = "defaultTalkCaravanChocoboUld_001",     -- Pack Chocobo (needs verifying)
    [1700039] = "defaultTalkWithBATERICH_100",          -- Baterich
	[1001230] = "defaultTalkWithUnaTayuun",				-- Waking Sands
	-- [1000042] = "defaultTalkWithAscilia_001",
    -- [1090549] = "defaultTalkWithInn_ExitDoor"         -- Ul'dah Inn Exit Door pushEvent - "Leave your room?"
	[1200336] = "defaultTalkWithInn_ExitDoor",            -- Ul'dah Inn Exit Door talkEvent - "Leave your room?"
    
	-- Need sourcing
	--    [???] = "defaultTalkCaravanChocoboUld_001"           -- Presumably used on the Caravan Chocobo escorts? Does a little animation.
	--    [???] = "defaultTalkWithExit01"                      -- "Leave this place?" - For quest locations like that four-bedroom room perhaps?
	--    [???] = "defaultTalkWithMarketNpc"                   -- NPC in the middle of the market wards that lets you port around I'm guessing?
	--    [???] = "defaultTalkWithHamletGuardUld_001"          -- 
}
    
function onTalk(player, quest, npc, eventName)

    local npcId = npc:GetActorClassId();
    local clientFunc = defaultTalkWil[npcId];
    
    if (npcId == 1000864) then -- Otopa Pottopa (Adv. Guild Inn NPC)
        if (player:IsQuestCompleted(110848)) then -- "Ring of Deceit" completed.
            callClientFunction(player, "delegateEvent", player, quest, "defaultTalkWithInn_Desk");
        else
            callClientFunction(player, "delegateEvent", player, quest, clientFunc);
        end
    elseif (npcId == 1002047) then -- Kopuru Fupuru (Rear-Entrance Inn NPC)
        if (player:IsQuestCompleted(110848)) then -- "Ring of Deceit" completed.
            defaultTalkWithInn(player, quest, "defaultTalkWithInn_Desk_2");
        else
            callClientFunction(player, "delegateEvent", player, quest, clientFunc);
        end
    elseif ((npcId >= 1002110) and (npcId <= 1002112)) then  -- Foundation Day 2012 NPCs
        talkWithSpecial(player, npcId, clientFunc)
    else
        callClientFunction(player, "delegateEvent", player, quest, clientFunc);
    end
    
    player:EndEvent();
end


function IsQuestENPC(player, quest, npc)
    return defaultTalkWil[npc:GetActorClassId()] ~= nil;
end

--[[
function defaultTalkWakingSands(player, quest, npc)
	local npcId = npc:GetActorClassId();
	local quest = player:GetQuest("Man200");
	require ("quests/man/man200");

	if (npcId == 1001281) then			-- Loam-Scented Lady
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_8");
	elseif (npcId == 1001279) then		-- Softhearted Septuagen
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_9");
	elseif (npcId == 1001280) then		-- Indigo Eyed Archer
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_10");
	elseif (npcId == 1001278) then		-- Barratrous Buccaneer
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_11");
	elseif (npcId == 1001282) then		-- Uncomfortable Brute
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_12");
	elseif (npcId == 1001275) then		-- Red Shoe'd Rascal'
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_13");
	elseif (npcId == 1001276) then		-- Abstracted Gladiator
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_14");	
	elseif (npcId == 1001374) then		-- Nenekani
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent020_5");
	elseif (npcId == 1001277) then		-- Chapeaued Chap
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_9");
	elseif (npcId == 1001274) then		-- Rough Spoken Fellow
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_10");
	elseif (npcId == 1001228) then		-- Satzfloh
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_18");
	elseif (npcId == 1001229) then		-- Perceivains
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_19");
	elseif (npcId == 1001230) then		-- Una Tayuun
		callClientFunction(player, "delegateEvent", player, GetStaticActor("Man200"), "processEvent000_20");
]]--

function defaultTalkWithInn(player, quest, clientFunc)
    local choice = callClientFunction(player, "delegateEvent", player, quest, clientFunc);
        
    if (choice == 1) then
        GetWorldManager():DoZoneChange(player, 244, nil, 0, 15, 0.048, 0, -5.737, 0);
    elseif (choice == 2) then
        if (player:GetHomePointInn() ~= 3) then
            player:SetHomePointInn(3);
            player:SendGameMessage(GetWorldMaster(), 60019, 0x20, 3071); --Secondary homepoint set to the Hourglass
        else            
            player:SendGameMessage(GetWorldMaster(), 51140, 0x20); --This inn is already your Secondary Homepoint
        end
    end
end



function talkWithSpecial(player, npcId, clientFunc)
        local splQuest = GetStaticActor("Spl000");
        local magickedPrism = 0;
        callClientFunction(player, "delegateEvent", player, splQuest, clientFunc, magickedPrism);
end