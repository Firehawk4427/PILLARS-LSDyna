from transformers import GPT2LMHeadModel, GPT2Tokenizer

# Load trained model and tokenizer
model = GPT2LMHeadModel.from_pretrained("./results")
tokenizer = GPT2Tokenizer.from_pretrained("gpt2")

def generate_response(question):
    inputs = tokenizer.encode(question, return_tensors='pt')
    outputs = model.generate(inputs, max_length=100, num_return_sequences=1)
    response = tokenizer.decode(outputs[0], skip_special_tokens=True)
    return response

while not done
    print("Armageddon Initialized")
    question = input()
    if question == "quit":
        print("Armageddon Shutting Down")
        done == True
    else:
        print(generate_response(question))

