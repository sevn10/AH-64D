class wpnDraw {
    class vabs {
        //T1
        MPD_ARROW_C(CHAN,  MPD_POS_BUTTON_TB_1_X, MPD_POS_BUTTON_T_Y, 4)
        MPD_TEXT_C(CHAN,   MPD_POS_BUTTON_TB_1_X, MPD_POS_BUTTON_T_Y, MPD_TEXT_STATIC("CHAN"))
        //T2
        MPD_ARROW_C(ASE,   MPD_POS_BUTTON_TB_2_X, MPD_POS_BUTTON_T_Y,3)
        MPD_TEXT_C(ASE,    MPD_POS_BUTTON_TB_2_X, MPD_POS_BUTTON_T_Y, MPD_TEXT_STATIC("ASE"))
        //T4
        MPD_ARROW_C(CODE,  MPD_POS_BUTTON_TB_4_X, MPD_POS_BUTTON_T_Y,4)
        MPD_TEXT_C(CODE,   MPD_POS_BUTTON_TB_4_X, MPD_POS_BUTTON_T_Y, MPD_TEXT_STATIC("CODE"))
        //T5
        MPD_ARROW_C(COORD, MPD_POS_BUTTON_TB_5_X, MPD_POS_BUTTON_T_Y,5)
        MPD_TEXT_C(COORD,  MPD_POS_BUTTON_TB_5_X, MPD_POS_BUTTON_T_Y, MPD_TEXT_STATIC("COORD"))
        //T6
        MPD_ARROW_C(UTIL,  MPD_POS_BUTTON_TB_6_X, MPD_POS_BUTTON_T_Y,4)
        MPD_TEXT_C(UTIL,   MPD_POS_BUTTON_TB_6_X, MPD_POS_BUTTON_T_Y, MPD_TEXT_STATIC("UTIL"))
        
        //R4
        MPD_BOX_BAR_L(TRAIN,    MPD_POS_BUTTON_R_X, MPD_POS_BUTTON_LR_4_Y)
        MPD_TEXT_L(TRAIN,      MPD_POS_BUTTON_R_X, MPD_POS_BUTTON_LR_4_Y, MPD_TEXT_STATIC("TRAIN"))
        //R5
        MPD_TEXT_L(LRFD_label, MPD_POS_BUTTON_R_X, MPD_POS_BUTTON_LR_5_Y - 0.5 * MPD_TEXT_HEIGHT, MPD_TEXT_STATIC("LRFD"))
        MPD_BOX_L(LRFD,        MPD_POS_BUTTON_R_X, MPD_POS_BUTTON_LR_5_Y + 0.5 * MPD_TEXT_HEIGHT, 5)
        MPD_BOX_BAR_L(LRFD,    MPD_POS_BUTTON_R_X, MPD_POS_BUTTON_LR_5_Y)
        MPD_TEXT_L(LRFD,       MPD_POS_BUTTON_R_X, MPD_POS_BUTTON_LR_5_Y + 0.5 * MPD_TEXT_HEIGHT, MPD_TEXT_STATIC("FIRST"))
        //R6
        MPD_ACQ_SRC(Acq, MFD_IND_WPN_ACQ_BOX, MFD_TEXT_IND_WPN_ACQ_SRC, Wpn_Acq)
        
        //B6
        MPD_TEXT_C(MANRNG_Label, MPD_POS_BUTTON_TB_6_X, MPD_POS_BUTTON_B_Y - MPD_TEXT_HEIGHT, MPD_TEXT_STATIC("MANRNG>"))
        MPD_TEXT_C(MANRNG,       MPD_POS_BUTTON_TB_6_X, MPD_POS_BUTTON_B_Y, MPD_TEXT_STATIC("1000"))

        #define WPN_WEAPON_OPTION(className, posX, weaponIndex, weaponName)\
            class className {\
                MPD_TEXT_C(Name, posX, MPD_POS_BUTTON_B_Y, MPD_TEXT_STATIC(weaponName))\
                class Selected{\
                    condition = C_COND(C_EQ(C_MPD_USER(MFD_IND_WPN_SELECTED_WPN), weaponIndex));\
                    MPD_BOX_C(Name, posX, MPD_POS_BUTTON_B_Y, 3)\
                }\
                class Actioned{\
                    condition = C_COND(C_EQ(C_MPD_USER(MFD_IND_WPN_WAS), weaponIndex));\
                    color[] = {0.05,0.25,0,0.5};\
                    class Polygon {\
                    type = polygon;\
                    points[] = {\
                        {\
                            { {posX-1.5*MPD_TEXT_WIDTH - MPD_BOX_PAD_X, MPD_POS_BUTTON_B_Y + MPD_TEXT_HEIGHT}, 1 },\
                            { {posX+1.5*MPD_TEXT_WIDTH + MPD_BOX_PAD_X, MPD_POS_BUTTON_B_Y + MPD_TEXT_HEIGHT}, 1 },\
                            { {posX+1.5*MPD_TEXT_WIDTH + MPD_BOX_PAD_X, MPD_POS_BUTTON_B_Y + 1.2*MPD_TEXT_HEIGHT}, 1 },\
                            { {posX-1.5*MPD_TEXT_WIDTH - MPD_BOX_PAD_X, MPD_POS_BUTTON_B_Y + 1.2*MPD_TEXT_HEIGHT}, 1 },\
                        },\
                    };\
                };\
            };\
        };

        WPN_WEAPON_OPTION(GUN, MPD_POS_BUTTON_TB_2_X, 1, "GUN")
        WPN_WEAPON_OPTION(RKT, MPD_POS_BUTTON_TB_5_X, 2, "RKT")
        WPN_WEAPON_OPTION(MSL, MPD_POS_BUTTON_TB_3_X, 3, "MSL")

        //B1
        MPD_BOX_C(WPN,  MPD_POS_BUTTON_TB_1_X, MPD_POS_BUTTON_B_Y, 3)
        MPD_TEXT_C(WPN, MPD_POS_BUTTON_TB_1_X, MPD_POS_BUTTON_B_Y, MPD_TEXT_STATIC("WPN"))
    }

    #include "wpn\background.hpp"
    #include "wpn\weapon_images.hpp"
    #include "wpn\status_windows.hpp"

    #include "wpn\arming.hpp"

    #include "wpn\unselected.hpp"
    #include "wpn\gun.hpp"
    #include "wpn\rkt.hpp"
    #include "wpn\msl.hpp"
};