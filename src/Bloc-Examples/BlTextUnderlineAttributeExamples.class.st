"
! Underline attribute

The simplest way to apply an underline attribute on a whole text would be to use ${method:TBlTextStyleable>>#underlinePaint:width:}$
${example:BlTextUnderlineAttributeExamples>>#textWithUnderline_1_to_5|previewShow=#gtTextFor:|previewExpanded|previewHeight=100}$

To add an underline to just a part of text it can be scoped with ${method:BlText>>#from:to:}$
${example:BlTextUnderlineAttributeExamples>>#textWithUnderline_3_to_4|previewShow=#gtTextFor:|previewExpanded|previewHeight=100}$

In addition to the simple API an underline attribute can be customized and then applied on a text using ${method:TBlTextStyleable>>#underlineDo:}$ helper method. Users should pass a block that accepts ${class:BlTextUnderlineAttribute}$ as an argument.
${example:BlTextUnderlineAttributeExamples>>#textWithUnderlineDo|previewShow=#gtTextFor:|previewExpanded|previewHeight=100}$
"
Class {
	#name : #BlTextUnderlineAttributeExamples,
	#superclass : #Object,
	#category : #'Bloc-Examples-Text'
}

{ #category : #attribute }
BlTextUnderlineAttributeExamples >> lineOfUnderlineAttribute [
	<gtExample>
	| anAttribute aCanvas aSpan aLine |

	anAttribute := self underlineAttribute.
	aSpan := BlTextParagraphFixedSpan new
		left: -5;
		baseline: 20@10;
		advance: 30.
		
	aCanvas := Bloc preferableSpartaCanvas offscreen.
	
	aLine := anAttribute lineOnSpartaCanvas: aCanvas with: aSpan.
	self assert: aLine from equals: 21@12.
	self assert: aLine to equals: 49@12.

	^ aLine
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> text [
	<gtExample>

	^ 'Hello' asRopedText fontSize: 75; foreground: Color veryDarkGray
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> textWithUnderlineDo [
	<gtExample>

	^ self text underlineDo: [ :anUnderline |
		anUnderline
			paint: Color red;
			opacity: 0.5;
			width: 6;
			beAbove;
			lineCap: BlStrokeLineCap round;
			dashArray: #(10 10) ]
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> textWithUnderline_1_to_5 [
	<gtExample>

	^ self text underlinePaint: (Color red alpha: 0.5) width: 6
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> textWithUnderline_2_to_3 [
	<gtExample>
	| aText |

	aText := self text.
	(aText from: 2 to: 3) underlinePaint: (Color red alpha: 0.5) width: 6.
	^ aText
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> textWithUnderline_2_to_4 [
	<gtExample>
	| aText |

	aText := self text.
	(aText from: 2 to: 4) underlinePaint: (Color red alpha: 0.5) width: 6.
	^ aText
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> textWithUnderline_3_to_4 [
	<gtExample>
	| aText |

	aText := self text.
	(aText from: 3 to: 4) underlinePaint: (Color red alpha: 0.5) width: 6.
	^ aText
]

{ #category : #accessing }
BlTextUnderlineAttributeExamples >> textWithUnderline_3_to_5 [
	<gtExample>
	| aText |

	aText := self text.
	(aText from: 3 to: 5) underlinePaint: (Color red alpha: 0.5) width: 6.
	^ aText
]

{ #category : #attribute }
BlTextUnderlineAttributeExamples >> underlineAttribute [
	<gtExample>
	| anAttribute |

	anAttribute := BlTextUnderlineAttribute new.
	self assert: anAttribute isBelow.
	self assert: anAttribute isAbove not.
	
	self assert: anAttribute opacity equals: 1.
	self assert: anAttribute width equals: 2.
	self assert: anAttribute paint color equals: Color black.
	self assert: anAttribute style equals: (BlStrokeStyle new
		lineCap: BlStrokeLineCap square;
		lineJoin: BlStrokeLineJoin round;
		miterLimit: 10.0;
		dashArray: #();
		dashOffset: 5).

	^ anAttribute
]
