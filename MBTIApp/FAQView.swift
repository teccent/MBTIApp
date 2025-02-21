//
//  FAQView.swift
//  MBTIApp
//
//  Created by Теона Магай on 26.10.2024.
//

import SwiftUI

struct FAQView: View {
    var body: some View {
        ScrollView {
            VStack (spacing: 15) {
                Text("What id MBTI?")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                Text("The Myers-Briggs Personality Type Indicator is a self-report inventory designed to identify a person's personality type, strengths, and preferences. The questionnaire was developed by Isabel Myers and her mother Katherine Briggs based on their work with Carl Jung's theory of personality types. Today, the MBTI inventory is one of the world's most widely used psychological instruments.")
                Text("Both Myers and Briggs were fascinated by Jung's theory of psychological types and recognized that the theory could have real-world applications. During World War II, they began researching and developing an indicator that could be utilized to help understand individual differences.")
                Text("Based on the answers to the questions on the inventory, people are identified as having one of 16 personality types. The goal of the MBTI is to allow respondents to further explore and understand their own personalities including their likes, dislikes, strengths, weaknesses, possible career preferences, and compatibility with other people.")
                Text("MBTI types")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.blue)
                Text("Extraversion (E) – Introversion (I)")
                    .bold()
                Text("The extraversion-introversion dichotomy was first explored by Jung in his theory of personality types as a way to describe how people respond and interact with the world around them. While these terms are familiar to most people, the way in which they are used in the MBTI differs somewhat from their popular usage.")
                Text("Extraverts (also often spelled extroverts) are outward-turning and tend to be action-oriented, enjoy more frequent social interaction, and feel energized after spending time with other people. Introverts are inward-turning and tend to be thought-oriented, enjoy deep and meaningful social interactions, and feel recharged after spending time alone.")
                Text("Sensing (S) – Intuition (N)")
                    .bold()
                Text("This scale involves looking at how people gather information from the world around them. Just like with extraversion and introversion, all people spend some time sensing and intuiting depending on the situation. According to the MBTI, people tend to be dominant in one area or the other.")
                Text("People who prefer sensing tend to pay a great deal of attention to reality, particularly to what they can learn from their own senses. They tend to focus on facts and details and enjoy getting hands-on experience. Those who prefer intuition pay more attention to things like patterns and impressions. They enjoy thinking about possibilities, imagining the future, and abstract theories.")
                Text("Thinking (T) – Feeling (F)")
                    .bold()
                Text("This scale focuses on how people make decisions based on the information that they gathered from their sensing or intuition functions. People who prefer thinking place a greater emphasis on facts and objective data.")
                Text("They tend to be consistent, logical, and impersonal when weighing a decision. Those who prefer feeling are more likely to consider people and emotions when arriving at a conclusion.")
                Text("Judging (J) – Perceiving (P)")
                    .bold()
                Text("The final scale involves how people tend to deal with the outside world. Those who lean toward judging prefer structure and firm decisions. People who lean toward perceiving are more open, flexible, and adaptable. These two tendencies interact with the other scales.")
                Text("Remember, all people at least spend some time engaged in extraverted activities. The judging-perceiving scale helps describe whether you behave like an extravert when you are taking in new information (sensing and intuiting) or when you are making decisions (thinking and feeling).")
            }
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    FAQView()
}
