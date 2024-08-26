from transformers import GPT2LMHeadModel, GPT2Tokenizer, Trainer, TrainingArguments
from datasets import load_dataset, load_metric

# Load pre-trained model and tokenizer
model_name = "gpt2"  # or another pre-trained model of your choice
model = GPT2LMHeadModel.from_pretrained(model_name)
tokenizer = GPT2Tokenizer.from_pretrained(model_name)

# Load and preprocess dataset
def preprocess_function(examples):
    return tokenizer(examples['text'], truncation=True, padding="max_length")

# Assume you have a dataset in CSV format
dataset = load_dataset('csv', data_files={'train': 'reddit_comments.csv'})
dataset = dataset.map(preprocess_function, batched=True)

# Define training arguments
training_args = TrainingArguments(
    output_dir="./results",
    evaluation_strategy="epoch",
    learning_rate=2e-5,
    per_device_train_batch_size=4,
    num_train_epochs=3,
    weight_decay=0.01,
)

# Initialize Trainer
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=dataset['train'],
)

# Train the model
trainer.train()
