window.addEventListener('message', function (event) {
  processEvent(event);
});

let temp_bone_data;
function processEvent (event) {
  switch (event.data.action) {
    case 'update': 
      updateData(event.data);
      break;
    case 'update_bone':
      if (event.data != temp_bone_data) {
        console.log(event.data);
        temp_bone_data = event.data;
      }
      break;
    case 'open':
      setVisible(true);
      break;
    case 'close':
      setVisible(false);
      break;
  }
}

function updateData(data) {
  setAbilityValue('str', data.str);
  setAbilityValue('agi', data.agi);
  setAbilityValue('int', data.int);
  setAbilityValue('luk', data.luk);

  setNormalValue('health', data.heal, 200);
  setNormalValue('armor', data.armor, 100);
  setNormalValue('food', data.food, 100, true);
  setNormalValue('thirst', data.thirst, 100, true);
  setNormalValue('drugs', data.drugs, 100);
  setNormalValue('drunk', data.drunk, 100);

  checkBlink('health', data.heal, 60);
  checkBlink('food', data.food, 15);
  checkBlink('thirst', data.thirst, 15);

  if (data.learned.length) {
    // learned skill
    $('#learnedSkill').text(data.learned);
    $('.skill.text').show();
  } else if (data.canlearn.length) {
    updateLearnableSkills(data.canlearn);
    $('.skill-button').show();
  }

  checkAlive(data.heal);
}

function setVisible(visible) {
  if (visible) $('.status-panel').show();
  else $('.status-panel').hide();
}

function getPercentage (value, maxValue) {
  return value * 100 / maxValue;
}

function setAbilityValue(ability, value) {
  $(`.${ability} .value`).text(value);
  setBarValue(ability, getPercentage(value, 100));
}

function setNormalValue(name, value, maxValue, isVertical) {
  if (!isVertical) setBarValue(name, getPercentage(value, maxValue));
  else setVerticalBarValue(name, getPercentage(value, maxValue));
}

function setBarValue(name, percentage) {
  $(`.${name} .bar-value`).css('width', `${percentage}%`);
}

function setVerticalBarValue(name, percentage) {
  $(`.${name} .vertical-value`).css('height', `${percentage}%`)
}

// skill
let lastLearnableSkills = '';
function updateLearnableSkills(learnableSkills) {
  if (lastLearnableSkills == learnableSkills) return;
  let skills = learnableSkills.split(',');
  let skills_html = '';
  for(let i = 0; i < skills.length; i++) {
    skills_html += `<tr><td class="td-name">${skills[i]}</td><td><button class="learn-button" data-item="${skills[i]}">學習</button></td></tr>`;
  }
  $('.skill-window tbody').html(skills_html);
  registerSkillsClickEvent();
  lastLearnableSkills = learnableSkills;
}

// alive status
let isAlive = true;
function checkAlive(health) {
  if (health) {
    if (!isAlive) {
      changeAliveStatus(true)
      isAlive = true;
    }
  } else {
    if (isAvlie) {
      changeAliveStatus(false)
      isAlive = false
    }
  }
}

function changeAliveStatus(isAlive) {
  if (isAlive) {
    $('#alive-status').show();
    $('#dead-status').hide();
  } else {
    $('#alive-status').hide();
    $('#dead-status').show();
  }
}

function checkBlink(name, value, limit) {
  if (value <= limit) {
    $(`.${name} img`).addClass('animation-blink');
  } else {
    $(`.${name} img`).removeClass('animation-blink');
  }
}

// register click event
function registerClickEvent() {
  $('.skill-img').click(function() {
    $('.skill-window').show();
  });

  $('.window-close').click(function() {
    $('.skill-window').hide();
  });
}

function registerSkillsClickEvent() {
  $('.learn-button').click(function() {
    console.log(this.dataset.item);
  });
}

// initialize
(function() {
  $('.status-panel').hide();
  $('.skill').hide();
  $('.skill-window').hide();
  changeAliveStatus(true);
  registerClickEvent();
})();

// for test
let data = {
  action: 'update',
  str: 30,
  agi: 40,
  int: 50,
  luk: 60,
  heal: 100,
  armor: 30,
  food: 40,
  thirst: 40,
  drugs: 70,
  drunk: 95,
  canlearn: '醫護天賦,黑手天賦,槍械天賦,開鎖天賦,廚師天賦',
  learned: ''
}
