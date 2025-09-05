faq_data = {
    'How do I reset my password':'Via the work pal app',
    'What is the govtech website?': 'https://www.tech.gov.sg',
    'Where can I find available careers for govtech':'You can go to Careers@gov',
    'What is Govtech': 'GovTech is the lead agency driving Singapore\'s Smart Nation initiative and public sector digital transformation.',
    'What is Govtech\'s mission':'Engineering Digital Government, Making Lives Better.'
}

question_keys = list(faq_data.keys())

while True:
    for index, key in enumerate(question_keys):
        print(f"{index + 1}: {key}")
        
    user_input = input('Please enter the number of the question you wish answered: ')
    
    if user_input == 'q' :
        print("Good bye!")
        break
    else:
        try:
            user_input = int(user_input)
            query_index = user_input - 1
            
            chosen_question = question_keys[query_index]
            chosen_answer = faq_data[chosen_question]
            
            print("\nQ: " + chosen_question + "\nA: " + chosen_answer +"\n")
        
        except (ValueError, IndexError, KeyError):
            print("\nPlease enter a number from 1 to " + str(len(faq_data))+ "\n")