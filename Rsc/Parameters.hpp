class Params {
	// can be 0 (sunny), 25, 50, 75 or 100 (storm))
	#define WEATHER_DEFAULT		0
	#include "\a3\functions_f\Params\paramWeather.hpp"
	#define DAYTIMEHOUR_DEFAULT 12
	#include "\a3\functions_f\Params\paramDaytimeHour.hpp"

	class CTI_POPO_TOWN_Units_Georgetown_ENABLED {
		title = $STR_CTI_POPO_TOWN_Units_Georgetown_ENABLED;
		values[]={0,1};
		texts[]={ $STR_CTI_DISABLED, $STR_CTI_ENABLED};
		default = 0;
	};

	class CTI_POPO_TOWN_Hostages_Georgetown_ENABLED {
		title = $STR_CTI_POPO_TOWN_Hostages_Georgetown_ENABLED;
		values[]={0,1};
		texts[]={ $STR_CTI_DISABLED, $STR_CTI_ENABLED};
		default = 0;
	};

	class CTI_POPO_Debug_ENABLE {
	title = $STR_CTI_POPO_Debug_ENABLE;
	values[]={0,1};
	texts[]={ $STR_CTI_DISABLED, $STR_CTI_ENABLED};
	default = 1;
	};
};
