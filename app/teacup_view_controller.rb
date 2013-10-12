class TeacupViewController < UIViewController
  stylesheet :teacup_view

  layout :root do
    subview(UILabel, :label)
    subview(UITextField, :name_field, delegate:self)
  end

  def textFieldShouldReturn(textField)
    textField.resignFirstResponder
    false
  end

end

Teacup::Stylesheet.new(:teacup_view) do
  style :label,
    frame: [[20, 84], [55, 15]],
    textColor: UIColor.blackColor,
    text: 'Name:',
    font: UIFont.boldSystemFontOfSize(UIFont.systemFontSize)

  style :name_field,
    frame: [[75, 76], [220, 30]],
    enablesReturnKeyAutomatically: true,
    autocorrectionType: UITextAutocorrectionTypeNo,
    autocapitalizationType: UITextAutocapitalizationTypeWords,
    borderStyle: UITextBorderStyleRoundedRect,
    clearButtonMode: UITextFieldViewModeWhileEditing
end
