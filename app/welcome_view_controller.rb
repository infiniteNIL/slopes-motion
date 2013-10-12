class WelcomeViewController < UIViewController
  extend IB

  outlet :label, UILabel

  def unwindFromConfirmationForm(storyboard)
    @label.text = 'And your back'
  end

end
