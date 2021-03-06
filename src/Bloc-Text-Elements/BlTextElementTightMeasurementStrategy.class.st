Class {
	#name : #BlTextElementTightMeasurementStrategy,
	#superclass : #BlTextElementMeasurementStrategy,
	#category : #'Bloc-Text-Elements'
}

{ #category : #'as yet unclassified' }
BlTextElementTightMeasurementStrategy >> boundsOf: aParagraph [
	<return: #BlBounds>
	| aMeasuredWidth aMeasuredHeight |

	aMeasuredWidth := aParagraph width.
	aMeasuredHeight := (aParagraph height).

	^ BlBounds origin: aParagraph left @ 0.0 extent: aMeasuredWidth @ aMeasuredHeight
]
