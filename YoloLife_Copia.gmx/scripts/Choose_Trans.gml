/// Choose Trans.

// Set the final level.
level = argument[0];

// Choose a transition.
var trans = choose(Trans_Rayman, FadeIn_FadeOut);

// Activate the transition!
script_execute(trans, level);
