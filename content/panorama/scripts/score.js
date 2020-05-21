function UpdateScore(table) {
	var heroesPanel = $("#Heroes");
	var i = 0;
	for (let heroName in table) {
		var heroPanel = heroesPanel.GetChild(i);
		heroPanel.GetChild(0).heroname = heroName; // DOTAHeroImage
		heroPanel.GetChild(1).text = formatDamage(table[heroName]["1"]);
		heroPanel.GetChild(2).text = formatDamage(table[heroName]["2"]);
		heroPanel.GetChild(3).text = formatDamage(table[heroName]["4"]);
		i++;
	}
}

function formatDamage(damage) {
	if (damage > 1000000000) {
		return (damage / 1000000000).toFixed(2) + "B";
	} else if (damage > 1000000) {
		return (damage / 1000000).toFixed(2) + "M";
	} else if (damage > 1000) {
		return (damage / 1000).toFixed(2) + "K";
	}
	return Math.trunc(damage);
}

(function () {
  GameEvents.Subscribe( "my_update_score", UpdateScore );
})();