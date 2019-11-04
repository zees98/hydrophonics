List<String> images = [
  'Tomato',
  'Lettuce',
  'Cucumber',
  'Basil',
  'Pepper',
  'Strawberry',
  'Melon',
  'Roses',
  'Herbs',
  'Spinach'
];
Map<String, List<String>> optimalEnv = {
  'Tomato': ['12 - 16', '55 - 65', '18 - 28'],
  'Lettuce': ['10 -12', '50 - 70', '16 - 22'],
  'Basil': ['14-18', '40-60', '19-29'],
  'Cucumber': ['12-14', '40-60', '18-27'],
  'Pepper': ['14-18', '55-65', '18-28'],
  'Strawberry': ['12-16', '60-75', '14-21'],
  'Melon': ['10-16', '60-70', '22-30'],
  'Roses': ['6-12', '60-70', '17-22'],
  'Herbs': ['14-18', '40-60', '19-29'],
  'Spinach': ['10-14', '40-60', '19-25']
};
Map<String, List<String>> optimalChem = {
  'Tomato': ['5.5-6.5', '2.0-5.0', '1400-3500'],
  'Lettuce': ['5.5-6.5', '0.8-1.2', '560-840'],
  'Basil': ['6-6.8', '1.0-1.6', '700-1120'],
  'Cucumber': ['5.8-6.0', '1.7-2.5', '1190-1750'],
  'Pepper': ['5.8-6.3', '1.8-2.8', '1400-2000'],
  'Strawberry': ['5.5-6.5', '1.8-2.2', '1260-1540'],
  'Melon': ['5.5-6.0', '2.0-2.5', '1400-1750'],
  'Roses': ['5.5-6.0', '1.5-2.5', '1050-1750'],
  'Herbs': ['5.5-7.0', '0.8-1.6', '560-1420'],
  'Spinach': ['5.5-6.6', '1.5-1.8', '1260-1610'],
};

Map<String, List<double>> suggestedNutrients = {
  'Tomato': [205, 70, 340, 160, 45, 102],
  'Lettuce': [140, 31, 190, 84, 24, 32],
  'Basil': [144, 31, 220, 95, 24, 50],
  'Cucumber': [200, 40, 280, 140, 40, 75],
  'Pepper': [190, 47, 285, 130, 40, 75],
  'Strawberry': [75, 37, 145, 65, 20, 50],
  'Melon': [220, 58, 320, 150, 50, 85],
  'Roses': [175, 64, 280, 120, 40, 70],
  'Herbs': [140, 31, 210, 98, 30, 60],
  'Spinach': [195, 40, 280, 134, 40, 75],
};
List<String> chemLabels = [
  'Nitrogen.png',
  'Phosphorus.png',
  'Potassium.png',
  'Calcium.png',
  'Magnesium.png',
  'Sulfur.png'
];