class ByHandViewController < UIViewController

  def viewDidLoad
    super
    setupForm()
  end

  def setupForm
    label = UILabel.alloc.initWithFrame [[20, 84], [0, 0]]
    label.text = 'Name:'
    label.font = UIFont.boldSystemFontOfSize(UIFont.systemFontSize)
    label.sizeToFit
    view.addSubview label

    frame = label.frame
    frame.origin.x = CGRectGetMaxX(frame) + 15
    frame.origin.y -= 5
    frame.size.width = CGRectGetWidth(view.frame) - CGRectGetMaxX(label.frame) - (15 * 2)
    frame.size.height = 30
    field = UITextField.alloc.initWithFrame frame
    field.borderStyle = UITextBorderStyleRoundedRect
    field.delegate = self
    field.enablesReturnKeyAutomatically = true
    field.autocapitalizationType = UITextAutocapitalizationTypeWords
    field.autocorrectionType = UITextAutocorrectionTypeNo
    field.clearButtonMode = UITextFieldViewModeWhileEditing
    view.addSubview field
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    false
  end

end
