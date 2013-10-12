class NibViewController < UIViewController
  extend IB

  outlet :label, UILabel

  def showNib(sender)
	vc = ModalNibViewController.new
	presentViewController(vc, animated:true, completion:nil)
    @label.textColor = UIColor.redColor
  end

end
