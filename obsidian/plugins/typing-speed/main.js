/*
THIS IS A GENERATED/BUNDLED FILE BY ESBUILD
if you want to view the source, please visit the github repository of this plugin
*/

var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __markAsModule = (target) => __defProp(target, "__esModule", { value: true });
var __export = (target, all) => {
  __markAsModule(target);
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __reExport = (target, module2, desc) => {
  if (module2 && typeof module2 === "object" || typeof module2 === "function") {
    for (let key of __getOwnPropNames(module2))
      if (!__hasOwnProp.call(target, key) && key !== "default")
        __defProp(target, key, { get: () => module2[key], enumerable: !(desc = __getOwnPropDesc(module2, key)) || desc.enumerable });
  }
  return target;
};
var __toModule = (module2) => {
  return __reExport(__markAsModule(__defProp(module2 != null ? __create(__getProtoOf(module2)) : {}, "default", module2 && module2.__esModule && "default" in module2 ? { get: () => module2.default, enumerable: true } : { value: module2, enumerable: true })), module2);
};
var __async = (__this, __arguments, generator) => {
  return new Promise((resolve, reject) => {
    var fulfilled = (value) => {
      try {
        step(generator.next(value));
      } catch (e) {
        reject(e);
      }
    };
    var rejected = (value) => {
      try {
        step(generator.throw(value));
      } catch (e) {
        reject(e);
      }
    };
    var step = (x) => x.done ? resolve(x.value) : Promise.resolve(x.value).then(fulfilled, rejected);
    step((generator = generator.apply(__this, __arguments)).next());
  });
};

// main.ts
__export(exports, {
  default: () => TypingSpeedPlugin
});
var import_obsidian = __toModule(require("obsidian"));
var DEFAULT_SETTINGS = {
  metrics: "wpm",
  darken_after_pausing: true,
  monkeytype_counting: true,
  show_minmax: false
};
function getMetricFactor(metric) {
  switch (metric) {
    case "cpm":
    case "wpm":
      return 60;
    case "cps":
      return 1;
  }
}
function average_array(array) {
  var avg = 0;
  array.forEach((val, idx) => {
    avg += val;
  });
  return avg / array.length;
}
function minmax_in_array(array) {
  var min_val = 1e4;
  var max_val = 0;
  var blurred_array = [];
  for (var i = 1; i < array.length - 1; i++) {
    var val = (array[i] + array[i + 1] + array[i - 1]) / 3;
    blurred_array.push(val);
  }
  blurred_array.forEach((val2, idx) => {
    max_val = Math.max(val2, max_val);
    min_val = Math.min(val2, min_val);
  });
  return { min: min_val, max: max_val };
}
function array_shiftadd(array, value) {
  for (var i = 0; i < array.length - 1; i++) {
    array[i] = array[i + 1];
  }
  array[array.length - 1] = value;
  return array;
}
var TypingSpeedPlugin = class extends import_obsidian.Plugin {
  constructor() {
    super(...arguments);
    this.Typed = [0];
    this.pollings_in_seconds = 1;
    this.keyTypedInSecond = 0;
    this.wordTypedInSecond = 0;
    this.keyTypedSinceSpace = 0;
  }
  hasStoppedTyping(typed) {
    const second_check = 2 * this.pollings_in_seconds;
    const check_start = typed.length - second_check;
    if (check_start < 0) {
      return false;
    }
    for (var i = check_start; i < typed.length; i++) {
      if (typed[i] != 0) {
        return false;
      }
    }
    return true;
  }
  onload() {
    return __async(this, null, function* () {
      yield this.loadSettings();
      this.statusBarItemEl = this.addStatusBarItem();
      this.statusBarItemEl.setText("");
      this.addSettingTab(new TypingSpeedSettingTab(this.app, this));
      this.registerDomEvent(document, "keydown", (evt) => {
        const keyRegex = /^[\p{L},;1-9]$/gu;
        if (evt.key.match(keyRegex)) {
          this.keyTypedInSecond += 1;
          this.keyTypedSinceSpace += 1;
        }
        if (evt.key == " " && this.keyTypedSinceSpace != 0) {
          if (this.settings.monkeytype_counting) {
            this.wordTypedInSecond += (this.keyTypedSinceSpace + 1) / 5;
          } else {
            this.wordTypedInSecond += 1;
          }
          this.keyTypedSinceSpace = 0;
        }
      });
      this.registerInterval(window.setInterval(() => {
        var average = 0;
        var fact = getMetricFactor(this.settings.metrics);
        var added = 0;
        var min_val = 0;
        var max_val = 0;
        if (this.settings.metrics == "cps" || this.settings.metrics == "cpm") {
          added = this.keyTypedInSecond;
          this.keyTypedInSecond = 0;
        } else if (this.settings.metrics == "wpm") {
          added = this.wordTypedInSecond;
          this.wordTypedInSecond = 0;
        }
        if (!this.hasStoppedTyping(this.Typed) || added != 0) {
          if (this.hasStoppedTyping(this.Typed)) {
            this.Typed = [];
          }
          if (this.Typed.length > this.pollings_in_seconds * 10) {
            array_shiftadd(this.Typed, added);
          } else {
            this.Typed.push(added);
          }
          average = Math.round(average_array(this.Typed) * fact);
          if (this.settings.show_minmax) {
            var { min: min_avg, max: max_avg } = minmax_in_array(this.Typed);
            min_val = Math.round(min_avg * fact);
            max_val = Math.round(max_avg * fact);
          }
          if (this.settings.darken_after_pausing) {
            this.statusBarItemEl.style.opacity = "100%";
          }
        } else {
          if (this.settings.darken_after_pausing) {
            this.statusBarItemEl.style.opacity = "50%";
          }
        }
        var final_str = average + " " + this.settings.metrics;
        if (this.settings.show_minmax) {
          final_str += " (" + min_val + "-" + max_val + ")";
        }
        this.statusBarItemEl.setText(final_str);
      }, 1e3 / this.pollings_in_seconds));
    });
  }
  onunload() {
  }
  loadSettings() {
    return __async(this, null, function* () {
      this.settings = Object.assign({}, DEFAULT_SETTINGS, yield this.loadData());
      if (this.settings.monkeytype_counting == void 0) {
        this.settings.monkeytype_counting = DEFAULT_SETTINGS.monkeytype_counting;
      }
      if (this.settings.show_minmax == void 0) {
        this.settings.show_minmax = DEFAULT_SETTINGS.show_minmax;
      }
    });
  }
  saveSettings() {
    return __async(this, null, function* () {
      yield this.saveData(this.settings);
    });
  }
};
var TypingSpeedSettingTab = class extends import_obsidian.PluginSettingTab {
  constructor(app, plugin) {
    super(app, plugin);
    this.plugin = plugin;
  }
  display() {
    const { containerEl } = this;
    containerEl.empty();
    containerEl.createEl("h2", { text: "Settings for typing-speed plugin" });
    new import_obsidian.Setting(containerEl).setName("Darken after 3 sec").setDesc("When you stop writing, after 3 seconds the typing speed display will darken.").addToggle((bool) => bool.setValue(true).onChange((value) => __async(this, null, function* () {
      this.plugin.settings.darken_after_pausing = value;
      yield this.plugin.saveSettings();
    })));
    new import_obsidian.Setting(containerEl).setName("Typing speed metric").setDesc("choose which metric to use for typing speed").addDropdown((text) => text.addOption("wpm", "word per minute").addOption("cps", "character per second").addOption("cpm", "character per minute").setValue(this.plugin.settings.metrics).onChange((value) => __async(this, null, function* () {
      this.plugin.settings.metrics = value;
      this.plugin.Typed = [0];
      yield this.plugin.saveSettings();
    })));
    new import_obsidian.Setting(containerEl).setName("Normalize word counting").setDesc("Replicate the word counting functionality of MonkeyType by considering each word as the number of characters divided by 5. While this method may not be as precise for direct word counting, it accounts for the varying lengths of words.").addToggle((bool) => bool.setValue(true).onChange((value) => __async(this, null, function* () {
      this.plugin.settings.monkeytype_counting = value;
      yield this.plugin.saveSettings();
    })));
    new import_obsidian.Setting(containerEl).setName("Show min-max typing speed").setDesc("Present the lowest and highest typing speeds observed, focusing specifically on the worst and best speeds recorded within 3-second intervals. Note that there is more numbers shifting per second so it may be more distracting").addToggle((bool) => bool.setValue(false).onChange((value) => __async(this, null, function* () {
      this.plugin.settings.show_minmax = value;
      yield this.plugin.saveSettings();
    })));
  }
};
