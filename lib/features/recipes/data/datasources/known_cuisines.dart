/// Cuisines worth browsing, most recipes first, with their country's flag.
///
/// `list.php?a=list` names 192 cuisines, but only these 29 had recipes
/// when checked on 2026-10-28 (5 to 60 each); the rest return none. Asking
/// all 192 on every launch would take 192 requests and hit TheMealDB's
/// rate limit, so the useful ones are listed here. Re-check now and then.
const List<({String name, String flag})> knownCuisines = [
  (name: 'British', flag: '🇬🇧'),
  (name: 'Spanish', flag: '🇪🇸'),
  (name: 'Turkish', flag: '🇹🇷'),
  (name: 'Chinese', flag: '🇨🇳'),
  (name: 'Jamaican', flag: '🇯🇲'),
  (name: 'Polish', flag: '🇵🇱'),
  (name: 'Thai', flag: '🇹🇭'),
  (name: 'Vietnamese', flag: '🇻🇳'),
  (name: 'Canadian', flag: '🇨🇦'),
  (name: 'Italian', flag: '🇮🇹'),
  (name: 'Australian', flag: '🇦🇺'),
  (name: 'Algerian', flag: '🇩🇿'),
  (name: 'Saudi Arabian', flag: '🇸🇦'),
  (name: 'Japanese', flag: '🇯🇵'),
  (name: 'Uruguayan', flag: '🇺🇾'),
  (name: 'Croatian', flag: '🇭🇷'),
  (name: 'Egyptian', flag: '🇪🇬'),
  (name: 'Filipino', flag: '🇵🇭'),
  (name: 'Greek', flag: '🇬🇷'),
  (name: 'Irish', flag: '🇮🇪'),
  (name: 'Malaysian', flag: '🇲🇾'),
  (name: 'Portuguese', flag: '🇵🇹'),
  (name: 'Tunisian', flag: '🇹🇳'),
  (name: 'Russian', flag: '🇷🇺'),
  (name: 'Ukrainian', flag: '🇺🇦'),
  (name: 'Mexican', flag: '🇲🇽'),
  (name: 'Moroccan', flag: '🇲🇦'),
  (name: 'Syrian', flag: '🇸🇾'),
  (name: 'Kenyan', flag: '🇰🇪'),
];
