//
//  ViewController.swift
//  Elementos-UIConfiguration
//
//  Created by Alexandre Cardoso on 08/02/21.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var segmentControl: UISegmentedControl!
	@IBOutlet weak var stepper: UIStepper!
	@IBOutlet weak var valueStepperLabel: UILabel!
	@IBOutlet weak var valueSwitchLabel: UILabel!
	@IBOutlet weak var switchOutlet: UISwitch!
	@IBOutlet weak var progress: UIProgressView!
	
	var progessValue: Progress?
	
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.configSegmented()
		self.configStepper()
		self.configSwitch()
		self.configProgress()
	}
	
	
	// MARK: - Functions
	
	func configSegmented() {
		// Insere/Altera Segment com Title
		self.segmentControl.insertSegment(withTitle: "Opção 3", at: 2, animated: true)
		
		// Setar o Titulo do Segment
		self.segmentControl.setTitle("Posição 0", forSegmentAt: 0)
		self.segmentControl.setTitle("Posição 1", forSegmentAt: 1)
		self.segmentControl.setTitle("Posição 2", forSegmentAt: 2)
	}
	
	func configStepper() {
		// Seta o valor do Stepper
		self.stepper.value = 15
		// Seta o valor Minimo do Stepper
		self.stepper.minimumValue = 5
		// Seta o valor Maximo do Stepper
		self.stepper.maximumValue = 30
		// Seta o valor que vai somando ou subtraindo do Value.
		self.stepper.stepValue = 5
	}
	
	func configSwitch() {
		self.switchOutlet.isOn = false
	}
	
	func configProgress() {
//		self.progress.progress = 0.5
//		self.progress.setProgress(0.7, animated: true)
		
		self.progessValue = Progress(totalUnitCount: Int64(self.stepper.maximumValue))
		self.progessValue?.completedUnitCount = Int64(self.stepper.value)
		
//		self.progressValue = Progress(totalUnitCount: Int64(self.stepper.maximumValue))
//		self.progressValue.completedUnitCount = Int64(self.stepper.value)
		
//		let progressValue = Progress(totalUnitCount: 100)
//		progressValue.completedUnitCount = 25
		
		let progressFloat = Float(self.progessValue?.fractionCompleted ?? 0.0)
		self.progress.setProgress(progressFloat, animated: true)
		
	}
	
	
	// MARK: - Actions

	@IBAction func tappedSegmented(_ sender: UISegmentedControl) {
		
		// Validação do Index selecionado
		switch sender.selectedSegmentIndex {
			case 0:
				print("posição 0")
				
			case 1:
				print("posição 1")
				
			case 2:
				print("posição 2")
				
			default:
				print("default")
		}
		
	}
	
	@IBAction func tappedStepper(_ sender: UIStepper) {
		
		self.valueStepperLabel.text = String(Int(sender.value))
		
		self.progessValue?.completedUnitCount = Int64(sender.value)
		let progressFloat = Float(self.progessValue?.fractionCompleted ?? 0.0)
		self.progress.setProgress(progressFloat, animated: true)
		
	}
	
	@IBAction func tappedSwitch(_ sender: UISwitch) {
		if sender.isOn {
			print("Ligado")
			self.valueSwitchLabel.text = "Ligado"
		} else {
			self.valueSwitchLabel.text = "Desligado"
			print("Desligado")
		}
	}
	
}

