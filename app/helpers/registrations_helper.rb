module RegistrationsHelper
  def player(p, classes = [])
    race = p.try(:race) || p.try(:registration).try(:race)
    classes = Array(classes) + ['race', race.icon_class]
    "<span class=\"#{classes.join ' '}\">#{p}</span>".html_safe
  end
end
